# Rosé Pine dotfiles
A backup for my hyprland `~/.config`

> [!IMPORTANT]  
> Don't expect this to work, out of the box...\
> Neither I can if this can mess up with your configs.

> [!TIP]
> Go apply [Rosé Pine](https://rosepinetheme.com/) theme yourself, lol


If you're still convinced to give this a try...
## Steps
1. Make sure you've following packages
```sh
paru -S --needed \
    alacritty \
    btop \
    fastfetch \
    helix \
    swaync \
    swayosd \
    vencord-bin \
    waybar \
    wlogout \
    zathura
```
[`paru`](https://github.com/Morganamilo/paru) is an AUR helper, maybe replace it with whatever you use.

2. Do make sure to store make a backup of the following configs
```sh
tar -czvhf ~/dotfiles-backup.tar.gz \
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
    zathur && \
    printf "\e[032mSuccess!! :D\e[0m\n" || \
    printf "\e[33mWelp, that didn't go well :(\e[0m\n"
```
To use this backup...
```sh
tar -xvf ~/dotfiles-backup.tar.gz -C ~/.config
```


3. It's time, you `stow` dotfiles
```sh
cd ~/rose-pine-hyprland && \
stow --adopt ~/rose-pine-hyprland || \
printf "\e[033mThat didn't go well, DiY, good luck :D \e[0m\n"
```
You should know, for `stow`ing, dotfiles must be present at root of `$HOME`.

