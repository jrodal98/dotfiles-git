# Polybar

![](polybar.png)

If you have two batteries in your laptop (like me), you'll need to Copy `95-battery.rules` to `/etc/udev/rules.d/95-battery.rules`. Make sure that the paths in the file have been modified properly.

The original copy of the battery combined shell script can be found [here](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/battery-combined-udev).  I modified it such that the icons and theming is consistent with the rest of the bar.
