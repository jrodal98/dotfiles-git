#!/usr/bin/env bash
# www.jrodal.dev

PASSWORD="password here"

command -v gpg >/dev/null 2>&1 || { echo "Install gnupg using your favorite package manager." >&2; exit 1; }
command -v curl >/dev/null 2>&1 || { echo "Install curl using your favorite package manager." >&2; exit 1; }
command -v tee >/dev/null 2>&1 || { echo "Install tee using your favorite package manager." >&2; exit 1; }


if [[ $# -ne 2 ]]; then
    echo "Usage: ./transfer_gpg.sh upload|download \$PATH|\$URL"
    exit 2
fi

case $1 in
    upload )
        gpg --batch --passphrase $PASSWORD --symmetric -o- $2 | curl -X PUT --upload-file "-" "https://transfer.sh/$(basename $2)" --progress-bar -w " $(date +%c)\n"| tee -a $HOME/.transfer_gpg_history
        ;;
    download )
        curl $2 --progress-bar | gpg --batch --passphrase $PASSWORD -d > "$(basename $2)"
        ;;
    *)
        echo "Usage: ./transfer_gpg.sh upload|download \$PATH|\$URL"
        exit 2
esac


