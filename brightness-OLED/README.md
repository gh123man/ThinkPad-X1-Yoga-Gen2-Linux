# Intro

This script enables the use of the backlight keys, and system backlight settings in Linux for the OLED screen. 

Tested on:
 - Debain 9 + xfce 
 - Kubuntu 17.10

# Prerequisites

### Debain 

```bash
sudo apt-get install inotify-tools
sudo apt-get install bc
```

# Installation 

1. Move `yogaX1-backlight.sh` to a location of your choice (I chose `~/scripts`)

2. Create or modify `~/.xsessionrc` and add ` ~/scripts/yogaX1-backlight &`. This will cause the script to run on startup and go to the background. 

3. Log out and log back in. Both the brightness keys + system brightness slider should now work. The screen should also dim correctly as defined by your battery settings. 


