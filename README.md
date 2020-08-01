<div align="center">
    <h1>Modern Awesome</h1>
</div>

[![HitCount](http://hits.dwyl.com/badxkarma/modern-awesome.svg)](http://hits.dwyl.com/badxkarma/modern-awesome)

![](/screenshot.png)

## Contents ##
1. [Details](#details)
2. [Features](#features)
3. [Dependencies](#dependencies)
4. [Installation](#installation)
5. [Dotfiles](#dotfiles)
6. [Folder Structure](#folderStructure)
7. [My Preferred Applications](#applications)
8. [Application Theming](#appTheming)
9. [Keybinds](#keybinds)
10. [Notes](#notes)

<a name="details"></a>
## Details ##
+ **OS**: Arch
+ **Shell**: Fish
+ **WM**: awesome
+ **Theme**: Breeze-Dark [GTK2/3]
+ **Icons**: korla [GTK2/3]
+ **Terminal**: Alacritty / iTerm2
+ **Font**: Droid Sans Mono Dotted for Powerline

<a name="features"></a>
## Features ##
+ Super lightweight
+ Easy installation / configuration
+ Very few dependencies
+ Wallpaper auto-blur functionality
+ Exit screen
+ Borders around active window
+ Locking (via `xsecurelock`)
+ Automatic dpi / resolution scaling
  + Note that xft.dpi must be properly assigned in the .Xresources file if you are using a high DPI screen
+ Supports multi monitor setups!
+ i3-like keybinds
+ Very stable: Built off of the awesome 4.3 release, no bleeding edge git versions required here!

<a name="dependencies"></a>
## Dependencies ##
I have made my best effort to reduce the number of dependencies by using the awesome API to its fullest extent, and allowing users to edit the `apps.lua` file (see [installation section](#installation)) to define their own preferred applications. That being said, here are the dependencies.

|Dependency|Description|
|:----------:|:-------------:|
|`awesome`|Window manager|
|`feh`|Fast image viewer used as wallpaper setting utility|
|`picom`|Window compositor, eliminates screen tearing and allows for cool fade effects|
|`rofi`|Application launcher|
|`xsecurelock`|Used to lock the screen|
|`imagemagick`|**OPTIONAL BUT NEEDED IF USING A DIFFERENT BACKGROUND**, used in config to generate blurred wallpaper|

### Optional Dependencies ###
These will improve the user experience but aren't required:
**Bear in mind that most of these dependencies come preinstalled on non arch systems. I would recommend reading their descriptions below to determine which ones you need to install. Alternatively, set up my config and install the packages based on what isn't appearing in the top panel.**
+ `xsecurelock`: Will be opened when the lock icon is selected in the exit window
+ `acpi`: Battery managing cli application, used by top bar widget to determine battery status
+ `xfce4-power-manager`: Lightweight power manager spawned when the top panel battery icon is clicked
+ `gnome-screenshot`: Screenshot tool, which is mapped to the Print Screen key in keys.lua. 
+ `alsa-utils`: Provides kernel driven sound drivers, which the control of has been mapped to volume keys in keys.lua

### Fonts You Should Install ###
+ `Droid Sans Mono Dotted for Powerline`: Powerline Patched font.

<a name="installation"></a>
## Installation ##
1. Ensure all [dependencies](#dependencies) are met
2. Clone this repository and place its contents into your `.config` folder
3. navigate to the `awesome/wallpaper` folder and place your desired wallpaper there, ensuring that it is named `wallpaper`. One  awesome (pun intended) feature of my config is that the filetype of the wallpaper can be any image filetype and it will automatically recognize it. Remember to delete the `blurredWallpaper` file in order to make the blurring script recognize a new wallpaper has been added and needs to be blurred 
4. edit the `apps.lua` file to define your desired default and startup applications
5. optional: edit the `keys.lua` file to change / add keybinds

<a name="dotfiles"></a>
## Dotfiles
I've turned away from symlinking everything because that was going to get unwieldy. Instead, I'm using a bare repo. These are the steps to build it.  
First, we create a bare repo in a new folder named `.dotfiles`.
```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```  
Next, I added an alias to my `config.fish` file that I use for this repo. This is the special sauce of this setup.
```
alias dot='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

```

Next, don't show untracked files (because that would be a lot) and add the remote. 
```
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:BaDxKaRMa/.dotfiles.git
```

Now, you can use the alias to add any file to wish to start syncing. Commit and push to see the results in your GitHub Repo.
```
cd $HOME
dot add .vimrc
dot commit -m "Add .vimrc"
dot push
```

<a name="folderStructure"></a>
## Awesome Folder File Structure ##
In order to avoid a poorly organized `rc.lua` spanning thousands of lines, it has been split into multiple files / folders:
+ `rc.lua`: Contains the script that runs when awesome starts (essentially links all the other files together)
+ `apps.lua`: Contains the default and startup applications
+ `keys.lua`: Contains keybinds
+ `rules.lua`: Contains window rules
+ `theme.lua`: Contains theme variables
+ `tags.lua`: Contains tag (aka workspace) information, edit this to change the tag's icon and behaviour
+ `icons`: stores icons used in WM
+ `components`: Folder that contains all of the components of the WM, such as panels, volume and brightness sliders, notification pop-ups, etc
+ `widgets`: Stores widgets used in the functionality of the components
+ `wallpaper`: Where wallpaper and its blurred varient is generated / stored

<a name="applications"></a>
## My Preferred Applications ##
+ **Text Editor - Vim:** It's just cool and easy to use
+ **File Manager - Pcmanfm**: Probably the most lightweight gui file browser and it has very few dependencies
+ **Web Browser - Chromium**: Almost Chrome
+ **Terminal - Alacritty**: Fast, lightweight and very configurable terminal
+ **Theme / Look & Feel Manager - lxappearance**: makes managing icon / cursor / application themes easy, only theme manager with no DE dependencies, and works very well

### Other cool applications you should install ###
+ `neofetch`: Displays system information in the terminal

<a name="appTheming"></a>
## Application Theming ##

<a name="keybinds"></a>
## Keybinds ##
**Note that the modkey is set to be the windows / command key. If you would like to use a different modkey check out the `keys.lua` file.**
If you are new to awesomewm, note that tag refers to workspace, and client refers to window.

### Keyboard ###
+ `mod + enter`: Spawn terminal
+ `mod + s`: Show help menu
+ `mod + d`: Spawn rofi (an application menu)
+ `mod + F11`: Make client fullscreen
+ `mod + m`: Maximize client
+ `mod + n`: Minimize client
+ `mod + shift + n`: Unminimize client
+ `mod + [1-9]`: Switch to tag [1-9]
+ `mod + shift + [1-9]`: Move client to tag [1-9]
+ `mod + space`: Change the tag layout, alternating between tiled, floating, and maximized
+ `mod + [up / down / left / right / h / j / k / l]`: Change client by direction
+ `mod + Shift + [up / down / left / right / h / j / k / l]`: Move client by direction
+ `mod + Control + [up / down / left / right / h / j / k / l]`: Resize client by direction
+ `mod + Escape`: Show exit screen

### Mouse ###
+ `mod + drag with left click`: Move client
+ `mod + drag with right click`: Resize client

<a name="notes"></a>
## Notes ##
+ [Awesome API Documentation](https://awesomewm.org/apidoc/index.html)
+ If you encounter any problems please open an issue in this repo and I will gladly investigate it
+ If you would like to change the wallpaper, ensure that the wallpaper is named "wallpaper" and is located in the `~/.config/awesome` folder. Also ensure that you delete the blurred wallpaper file in order for the blurring script to recognize it needs to generate a new blurred wallpaper
+ This is a fork of [this project](https://github.com/WillPower3309/awesome-dotfiles), go take a look at his work too!
