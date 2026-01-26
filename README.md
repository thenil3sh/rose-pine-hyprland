# RosePine dotfiles
A backup for my Rose Pine themed dotfiles (hyprland)

> [!IMPORTANT]  
> Don't expect this to work, out of the box...\
> Neither I can assure, if this can mess up with your configs.

> [!TIP]
> Go apply [Rosé Pine](https://rosepinetheme.com/) theme yourself, lol


\
\
If you're still convinced to give it a try...
## Steps
### 1. Requirements
You'll need following packages installed
```sh
paru -S --needed \
    alacritty \
    btop \
    fastfetch \
    helix \
    stow \
    swaync \
    swayosd \
    vencord-bin \
    waybar \
    wlogout \
    zathura
```
[`paru`](https://github.com/Morganamilo/paru) is an AUR helper.\
Replace it with, `yay`,`pacman`, or whatever you use.

### 2. A backup of your old config
It's nice to have it...
```sh
tar -czvf ~/dotfiles-backup.tar.gz \
    --ignore-failed-read \
    -C ~/.config \
    alacritty \
    btop \
    fastfetch \
    helix \
    hypr \
    stow \
    swaync \
    swayosd \
    Vencord \
    waybar \
    wlogout \
    zathura && \
    printf "\e[032mSuccess!! :D\e[0m\n" || \
    printf "\e[33mWelp, that didn't go well :(\e[0m\n"
```
### Restore backup (if you mess up fr)
```sh
tar -xvf ~/dotfiles-backup.tar.gz -C ~/.config
```


### 3. It's time, you `stow` dotfiles
- Clone this repository
```sh
git clone https://github.com/thenil3sh/rose-pine-hyprland.git ~/dotfiles
cd ~/dotfiles
```
- See, if `stow`ing, will end up well
```sh
stow . --simulate --verbose --adopt
```
- If you see a good output, you're ready to `stow`
```sh
stow --adopt . 
```


## Uninstall
You're fed up with this config, you would want to remove these config.
```sh
cd ~/dotfiles
stow --delete .
```
Restore the backup as mentioned in **Step 2**

