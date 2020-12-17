# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
from libqtile.config import (
    Key,
    Screen,
    Group,
    Drag,
    Click,
    Match,
    ScratchPad,
    DropDown,
    Rule,
)
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook
import gi
import subprocess

gi.require_version("Gdk", "3.0")
from gi.repository import Gdk

from typing import List  # noqa: F401

mod = "mod4"
TERMINAL = "kitty"
BROWSER = "brave"
FILE_MANAGER = "dolphin"
MAIL = "thunderbird-beta"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    # Switch window focus to other pane(s) of stack
    Key([mod], "h", lazy.layout.previous(), lazy.layout.left()),  # Stack  # xmonad-tall
    Key([mod], "l", lazy.layout.next(), lazy.layout.right()),  # Stack  # xmonad-tall
    Key([mod, "shift"], "l", lazy.layout.swap_right(),),  # xmonad-tall
    Key([mod, "shift"], "h", lazy.layout.swap_left(),),  # xmonad-tall
    # Move windows up or down in current stack
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod], "semicolon", lazy.next_screen(), desc="Move focus to next monitor"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="toggle floating"),
    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),
    # change size
    Key([mod, "control"], "k", lazy.layout.grow()),
    Key([mod, "control"], "j", lazy.layout.shrink()),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn(TERMINAL)),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod], "r", lazy.spawncmd()),
    Key([mod], "p", lazy.spawn("passmenu")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pulseaudio-ctl up")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pulseaudio-ctl down")),
    Key([], "XF86AudioMute", lazy.spawn("pulseaudio-ctl mute")),
    Key([], "XF86AudioMicMute", lazy.spawn("pulseaudio-ctl mute-input")),
    Key([mod], "Down", lazy.spawn("playerctl -p spotifyd play-pause")),
    Key([mod], "Left", lazy.spawn("playerctl -p spotifyd previous")),
    Key([mod], "Right", lazy.spawn("playerctl -p spotifyd next")),
    Key([mod], "space", lazy.spawn("rofi -modi 'drun#ssh' -show drun -show-icons")),
    Key(
        [], "Print", lazy.spawn("/home/jake/.config/dunst/screenshot.sh flameshot full")
    ),
    Key(
        ["control"],
        "Print",
        lazy.spawn("/home/jake/.config/dunst/screenshot.sh flameshot select"),
    ),
    Key([mod], "e", lazy.spawn(f"{TERMINAL} -e ranger")),
    Key([mod, "shift"], "e", lazy.spawn(FILE_MANAGER)),
    Key([mod], "b", lazy.spawn(f"{BROWSER}")),
    Key([mod], "r", lazy.spawn(f"{TERMINAL} -e rtv")),
    Key([mod, "control"], "b", lazy.spawn(f"{TERMINAL} -e 'bmenu'")),
    Key([mod], "g", lazy.spawn("/home/jake/bin/grade-manager")),
    Key([mod], "m", lazy.spawn(MAIL)),
    Key([mod], "s", lazy.spawn("signal-desktop")),
    Key(
        [mod, "shift"],
        "x",
        lazy.spawn("/home/jake/.config/qtile/scripts/qtile_exit.sh"),
    ),
]

gdkdsp = Gdk.Display.get_default()
num_active_displays = gdkdsp.get_n_monitors()

if num_active_displays == 2:
    groups_by_screen = ["12345", "67890"]
else:
    groups_by_screen = ["1234567890"]

# Scratchpads


all_groups = "".join(groups_by_screen)
groups = (
    [Group(i) for i in all_groups[:-1]]
    + [
        Group(
            all_groups[-1],
            matches=[Match(wm_class=["Mail", "Signal"])],
            layout="treetab",
        )
    ]
    + [ScratchPad("scratchpad", [DropDown("term", TERMINAL),],)]
)


keys.append(Key([mod], "t", lazy.group["scratchpad"].dropdown_toggle("term")))
for j, names in enumerate(groups_by_screen):
    keys.extend(
        [
            Key([mod], i, lazy.to_screen(j), lazy.group[i].toscreen(toggle=False))
            for i in names
        ]
    )

    keys.extend([Key([mod, "shift"], i, lazy.window.togroup(i)) for i in all_groups])

layout_theme = {
    "border_width": 0,
    "margin": 6,
    # "border_focus": "881111",
    # "border_normal": "1D2330",
    "single_margin": 0,
    # "single_border_width": 0,
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    layout.TreeTab(**layout_theme),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [
    ["#292d3e", "#292d3e"],  # panel background
    ["#434758", "#434758"],  # background for current screen tab
    ["#ffffff", "#ffffff"],  # font color for group names
    ["#ff5555", "#ff5555"],  # border line color for current tab
    ["#8d62a9", "#8d62a9"],  # border line color for other tab and odd widgets
    ["#668bd7", "#668bd7"],  # color for the even widgets
    ["#e1acff", "#e1acff"],  # window name
]

widget_defaults = dict(font="TerminessTTF Nerd Font", fontsize=16, padding=5)
extension_defaults = widget_defaults.copy()


def poll_audio():
    try:
        volume_level_str, sink_status, _ = (
            subprocess.run(["pulseaudio-ctl", "full-status"], stdout=subprocess.PIPE)
            .stdout.decode("utf-8")
            .strip()
            .split()
        )

        volume_level = int(float(volume_level_str))
        is_sink_muted = sink_status == "yes"
    except:
        return "ERR"

    if is_sink_muted:
        output = "婢 M"
    else:
        if volume_level <= 20:
            output = ""
        elif volume_level <= 50:
            output = "奔"
        else:
            output = "墳"
        output += f" {volume_level}"

    return output


def poll_battery():
    # CONFIGURATION
    power_supply_path = "/sys/class/power_supply"
    ac_name = "AC"
    batteries = ["BAT0", "BAT1"]
    charging_icons = ("", "", "", "", "", "", "")
    charging_thresholds = (96, 90, 80, 60, 40, 20, 0)
    not_charging_icons = ("", "", "", "", "", "", "", "", "", "")
    not_charging_thresholds = (96, 90, 80, 70, 60, 50, 40, 30, 20, 0)

    # ENERGY LEVEL + STATE DETERMINATION
    energy_level = 0
    energy_max = 0
    try:
        with open(os.path.join(power_supply_path, ac_name, "online")) as f:
            is_charging = float(f.read().strip()) == 1
        for battery in batteries:
            with open(os.path.join(power_supply_path, battery, "energy_now")) as f:
                energy_level += float(f.read().strip())
            with open(os.path.join(power_supply_path, battery, "energy_full")) as f:
                energy_max += float(f.read().strip())
    except:
        return "ERR"

    battery_percent = int((energy_level / energy_max) * 100)

    # ICON DETERMINATION

    thresholds_and_icons = (
        zip(charging_thresholds, charging_icons)
        if is_charging
        else zip(not_charging_thresholds, not_charging_icons)
    )

    output_icon = ""
    for threshold, icon in thresholds_and_icons:
        if battery_percent >= threshold:
            output_icon = icon
            break

    # maximum energy level for a battery is not 100%.
    # this hack outputs a practically full charging battery
    # as a 100% charged battery
    if output_icon == charging_icons[0]:
        battery_percent = 100

    return f"{output_icon} {battery_percent}%"


def poll_dunst():
    try:
        dunst_status = (
            subprocess.run(["dunstctl", "is-paused"], stdout=subprocess.PIPE)
            .stdout.decode("utf-8")
            .strip()
        )

        return "" if dunst_status == "false" else ""
    except:
        return "ERR"


# only use one poll widget to prevent duplicate processes

audio_widget = widget.GenPollText(
    func=poll_audio,
    update_interval=1,
    mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn("pavucontrol")},
)

battery_widget = widget.GenPollText(func=poll_battery, update_interval=60)


vpn_widget = widget.GenPollText(
    func=lambda: subprocess.run(
        ["/home/jake/.config/qtile/scripts/vpn.sh", "print-addr"],
        stdout=subprocess.PIPE,
    )
    .stdout.decode("utf-8")
    .strip(),
    update_interval=30,
    mouse_callbacks={
        "Button1": lambda qtile: qtile.cmd_spawn(
            "/home/jake/.config/qtile/scripts/vpn.sh toggle"
        )
    },
)

dunst_widget = widget.GenPollText(
    func=poll_dunst,
    update_interval=5,
    mouse_callbacks={
        "Button1": lambda qtile: qtile.cmd_spawn("dunstctl set-paused toggle")
    },
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(visible_groups=groups_by_screen[i]),
                widget.Sep(linewidth=1, padding=10),
                widget.CurrentLayout(),
                widget.Sep(linewidth=1, padding=10),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Sep(linewidth=1, padding=10),
                dunst_widget,
                widget.Sep(linewidth=1, padding=10),
                audio_widget,
                widget.Sep(linewidth=1, padding=10),
                battery_widget,
                widget.Sep(linewidth=1, padding=10),
                vpn_widget,
                widget.Sep(linewidth=1, padding=10),
                widget.Wlan(
                    format="直  {essid}",
                    disconnected_message="睊  Disconnected",
                    interface="wlp58s0",
                    mouse_callbacks={
                        "Button1": lambda qtile: qtile.cmd_spawn("networkmanager_dmenu")
                    },
                ),
                widget.Sep(linewidth=1, padding=10),
                widget.Clock(format="  %I:%M %p"),
            ],
            24,
        ),
    )
    for i in range(len(groups_by_screen))
]

# use genpolltext widget + my polybar script for combined battery
# convert the code to python though


# iwlib

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False

cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"

# for_window [title="alsamixer"] floating enable border pixel 1
# for_window [class="calamares"] floating enable border normal
# for_window [class="Clipgrab"] floating enable
# for_window [title="File Transfer*"] floating enable
# for_window [class="fpakman"] floating enable
# for_window [class="Galculator"] floating enable border pixel 1
# for_window [class="GParted"] floating enable border normal
# for_window [title="i3_help"] floating enable sticky enable border normal
# for_window [class="Lightdm-settings"] floating enable
# for_window [class="Lxappearance"] floating enable sticky enable border normal
# for_window [class="Manjaro-hello"] floating enable
# for_window [class="Manjaro Settings Manager"] floating enable border normal
# for_window [title="MuseScore: Play Panel"] floating enable
# for_window [class="Nitrogen"] floating enable sticky enable border normal
# for_window [class="Oblogout"] fullscreen enable
# for_window [class="octopi"] floating enable
# for_window [class="Pamac-manager"] floating enable
# for_window [class="Pavucontrol"] floating enable
# for_window [class="qt5ct"] floating enable sticky enable border normal
# for_window [class="Qtconfig-qt4"] floating enable sticky enable border normal
# for_window [class="Simple-scan"] floating enable border normal
# for_window [class="(?i)System-config-printer.py"] floating enable border normal
# for_window [class="Timeset-gui"] floating enable border normal
# for_window [class="(?i)virtualbox"] floating enable border normal
# for_window [class="Xfburn"] floating enable

#


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])

# crashes qtile for some reason, despite being copy-pasted from the docs...
# there's a github issue for it that has gone state.
# from libqtile import qtile as libqtile_qtile
# @hook.subscribe.screen_change
# def restart_on_randr(ev):
#     libqtile_qtile.cmd_restart()


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
