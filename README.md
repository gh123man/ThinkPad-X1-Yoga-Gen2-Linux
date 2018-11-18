# Intro

This repo contains scripts, guides, and tools to make using the 2nd generation ThinkPad X1 Yoga better with Linux. 

Most of this was only tested on Debain. Ubuntu should work with the same instructions. Please feel free to add other distros via a pull request. 

# OLED Backlight
[Oled backlight steps](brightness-OLED/)

# Touchpad 

## mTrack driver (xf86-input-mtrack)
This driver works really well with a good configuration. 
The following config enables the following:
 - left click anywhere
 - left click at bottom left edge
 - right click on bottom right edge 
 - 2 finger right click
 - scroll coasting (kinetic scrolling)
 - sane sensitivity + scroll distance


### Compile from source

Use the forked version of the driver found here: https://github.com/p2rkw/xf86-input-mtrack as the original is not maintained anymore

### Config

```xf86conf
Section "InputClass"
    MatchIsTouchpad "on"
    Identifier      "Touchpads"
    Driver          "mtrack"
    Option          "Sensitivity" "0.55"
    Option          "FingerHigh" "5"
    Option          "FingerLow" "1"
    Option          "IgnoreThumb" "true"
    Option          "IgnorePalm" "true"
    Option          "TapButton1" "0"
    Option          "TapButton2" "0"
    Option          "TapButton3" "0"
    Option          "TapButton4" "0"
    Option          "ClickFinger0" "1"
    Option          "ClickFinger1" "1"
    Option          "ClickFinger2" "3"
    Option          "ClickFinger3" "0"
    Option          "ButtonZonesEnable" "true"
    Option          "ButtonMoveEmulate" "false"
    Option          "ButtonIntegrated" "true"
    Option          "ClickTime" "25"
    Option          "MaxTapTime" "120"
    Option          "BottomEdge" "25"
    Option          "SwipeLeftButton" "8"
    Option          "SwipeRightButton" "9"
    Option          "SwipeUpButton" "0"
    Option          "SwipeDownButton" "0"
    Option          "ScrollDistance" "75"
    Option          "ScrollUpButton" "4"
    Option          "ScrollDownButton" "5"
    Option          "ScrollCoastDuration" "800"
    Option          "ScrollCoastEnableSpeed" ".4"
EndSection

```


## Synaptics Driver

The touchpad will work out of the box on debain + xfce. But you will want to install the more specific driver to have more configuration options. 

```bash
sudo apt-get install xserver-xorg-input-synaptics 
```

You can use `xinput set-prop "SynPS/2 Synaptics TouchPad"` to adjust settings. The GUI trackpad settings did not work for me in xfce. 

To make the settings stick by default, add them to `~/.xsessionrc` like so: 
```bash 
    xinput set-prop "SynPS/2 Synaptics TouchPad" 330 0 0 0 0 0 0 0 0
```


# Repair GRUB after a windows 10 upgrade

https://askubuntu.com/a/655279

1. Run CMD as admin 
2. bcdedit /set {bootmgr} path \EFI\debian\grubx64.efi
3. reboot
