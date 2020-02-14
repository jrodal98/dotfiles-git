#!/usr/bin/env python3
# www.jrodal.dev

import sys
import re
import datetime
import argparse


def perr_and_exit(message):
    print(message, file=sys.stderr)
    sys.exit(1)


def parse_sections(filename):
    with open(filename, "r") as f:
        toks = re.split(r"## (.+)\n", f.read())[1:]
        sections = {}
        for sect, sect_text in zip(toks[::2], toks[1::2]):
            toks = re.split(r"\n- (.+)\n", sect_text)[1:]
            tasks = dict(zip(toks[::2], toks[1::2]))
            sections[sect] = tasks
    return sections


def write_to_file(filename, sections):
    with open(filename, "w") as f:
        first = True
        for section, task_dict in sections.items():
            if first:
                first = False
                f.write(f"## {section}\n\n")
            else:
                f.write(f"\n## {section}\n\n")
            for task, desc in task_dict.items():
                f.write(f"- {task}\n")
                f.write(desc.rstrip() + "\n")


def move(filename, clear=True, token="[W]", days=7,
         source="Done", to="Backlog"):
    sections = parse_sections(filename)
    if source not in sections:
        perr_and_exit(f"Error: {source} section not found.")
    elif to not in sections:
        perr_and_exit(f"Error: {to} section not found.")
    source_items = tuple(sections[source].items())
    for task, desc in source_items:
        if token in task:
            # 2020-02-21
            date_match = re.search(
                r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}", desc, re.MULTILINE)
            if date_match:
                new_date = str(datetime.datetime.strptime(
                    date_match.group(), "%Y-%m-%d %H:%M") +
                    datetime.timedelta(days=days))[:-3]
                desc = desc.replace(date_match.group(), new_date)
            sections[to][task] = desc.replace("[x]", "[ ]")
            del sections[source][task]
    if clear:
        sections[source] = {}
    write_to_file(filename, sections)


def clear(filename, source="Done"):
    sections = parse_sections(filename)
    if source not in sections:
        perr_and_exit(f"Error: {source} section not found.")
    sections[source] = {}
    write_to_file(filename, sections)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        perr_and_exit("Error: incorrect usage of script. \
                Provide the action you'd wish to perform and the filepath ")
    action = sys.argv[1]
    parser = argparse.ArgumentParser()
    parser.add_argument("action", help="Actions: 'clear' or 'move'")
    parser.add_argument("filepath", help="Path to taskell markdown file")
    parser.add_argument("source", help="Source section name")
    if action == "move":
        parser.add_argument("destination", help="Destination section name")
        parser.add_argument(
            "-t", "--token", default="[W]", help="Token used to identify tasks to move")
        parser.add_argument("-d", "--days", type=int, default=7,
                            help="Number of days to add to moved dates")
        parser.add_argument("-c", "--clear", action="store_true",
                            help="Clear section after moving relevant tasks")

        args = parser.parse_args()
        move(args.filepath, clear=args.clear, token=args.token,
             days=args.days, source=args.source, to=args.destination)
    elif action == "clear":
        args = parser.parse_args()
        clear(args.filepath, args.source)
    else:
        perr_and_exit("Invalid action. Valid actions are 'clear' and 'move'.")
