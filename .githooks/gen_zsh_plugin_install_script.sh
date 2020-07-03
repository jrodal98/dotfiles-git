#!/usr/bin/env zsh
# www.jrodal.dev

FILENAME="$HOME/.install_zsh_plugins.sh"

echo '#!/usr/bin/env zsh' > $FILENAME
echo '# www.jrodal.dev' >> $FILENAME
echo '' >> $FILENAME

for d in $ZSH/custom/plugins/*; do
    if [ -d "$d/.git" ]; then
        echo "git clone $(sed -n 's/^\turl = \(\.*\)/\1/p' $d/.git/config) \$ZSH/custom/plugins/" >> $FILENAME
    fi
done

chmod +x $FILENAME
