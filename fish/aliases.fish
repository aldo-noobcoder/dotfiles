

alias ls='lsd'
alias lls="command ls"
alias cat='bat'
alias ccat="command cat"
alias rm="trash -v"
alias df="duf"
alias ping="prettyping"
alias se="sudo -e"
alias pol="/usr/bin/lxqt-policykit-agent &"
alias pss="sudo pacman -Ss"
alias cd='z'
alias syu="paru"
alias nano="micro"
alias m="micro"
alias s="paru -S"
alias r="paru -Rns"
alias ss="paru -Ss"
alias sy="paru -Sy"
alias cfg="micro ~/.config/fish/config.fish"
alias ncfg="micro ~/.config/niri/config.kdl"
alias vite="pnpm create vite@latest"
alias ff="fastfetch"
alias c="clear"
alias cc="sudo rmdir /var/cache/pacman/pkg/download-*"
alias xampp="/opt/lampp/xampp"
alias calendar="khal calendar"
alias monkeytype="toofan"
alias up="yes | arch-update"
alias pg="ping -c 3 google.com"
alias empty="command rm -rf ~/.local/share/Trash/files/"
alias wifi="~/Documents/Scripts/wifi.sh"
alias egg="~/Documents/Scripts/egg.sh"
alias matrix="unimatrix -s 95"
alias clock="tty-clock -S -s -c -C 6"
alias clock2="tenki --wind disable --blink-colon --timer-color cyan"
alias sys="systemctl start"
alias mute="systemctl --user stop pipewire.socket pipewire-pulse.socket
                                   systemctl --user stop pipewire.service pipewire-pulse.service wireplumber.service"
alias stem="steam -no-cef-sandbox -cef-disable-gpu-compositing -cef-disable-gpu -vgui -console"
alias nano="micro"

#  * Create missing directories in path when calling `mkdir`
alias mkdir='mkdir -pv'

#  * `fullpath` command to print full file path
alias fullpath='readlink -e'

#  * `rmm` command to remove directories, but ask nicely
alias rmm='rm -rvI'

#  * `cpp` command to copy directories, but ask nicely
alias cpp='cp -Rv'

#  * `cp` to ask when overwriting files
alias cp='cp -iv'

#  * `mv` to ask when overwriting files
alias mv='mv -iv'

alias adb='HOME="$XDG_DATA_HOME"/android command adb'


#  * Human readable sizes for `df`, `du`, `free` (i.e. Mb, Gb etc)
alias df='df -h'
alias du='du -ch'
alias free='free -m'

#  * `fs` command to show free space on physical drives
alias fs='df -h -x squashfs -x tmpfs -x devtmpfs'

#  * `disks` command to List disks
#    - Clearly shows which disks are mounted temporary
#    - I always run this command before `dd` sd-card, to make 100% sure not to override system partition
alias disks='lsblk -o HOTPLUG,NAME,SIZE,MODEL,TYPE | awk "NR == 1 || /disk/"'

#  * `partitions` command to list partitions
alias partitions='lsblk -o HOTPLUG,NAME,LABEL,MOUNTPOINT,SIZE,MODEL,PARTLABEL,TYPE,UUID | grep -v loop | cut -c1-$COLUMNS'

#  * `sizeof` command to show size of file or directory
alias sizeof="du -hs"

#  * `wget` to save file with provided name
alias wget='wget --content-disposition'
alias yda="yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata"
