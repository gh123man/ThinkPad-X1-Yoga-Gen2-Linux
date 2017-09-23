# Intro

This repo contains scripts, guides, and tools to make using the 2nd generation ThinkPad X1 Yoga better with Linux. 

Most of this was only tested on Debain. Ubuntu should work with the same instructions. Please feel free to add other distros via a pull request. 

# OLED Backlight
[Oled backlight steps](brightness-OLED/README.md)

# Touchpad 

The touchpad will work out of the box on debain + xfce. But you will want to install the more specific driver to have more configuration options. 

```bash
sudo apt-get install xserver-xorg-input-synaptics 
```

You can use `xinput set-prop "SynPS/2 Synaptics TouchPad"` to adjust settings. The GUI trackpad settings did not work for me in xfce. 

To make the settings stick by default, add them to `~/.xsessionrc` like so: 
```bash 
    xinput set-prop "SynPS/2 Synaptics TouchPad" 330 0 0 0 0 0 0 0 0
```

