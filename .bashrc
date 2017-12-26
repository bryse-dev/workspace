#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Environment
export VISUAL="vim"
export GOPATH="/home/bryson/noshub/golang"

# Custom
cd ~
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
alias sizehome='xrandr -s 1920x1080'
alias sizework='xrandr -s 3440x1412'
alias sizemac='xrandr -s 1680x1050'
alias sizeprojector='xrandr -s 1280x800'
#xrandr --newmode "2560x1600_60.00"  348.16  2560 2752 3032 3504  1600 1601 1604 1656  -HSync +Vsync
#xrandr --addmode 2560x1600_60.00
#xrandr --addmode VNC-0  2560x1600_60.00
alias sizethirty='xrandr -s 2560x1600'
alias startvnc='vncserver -geometry 3440x1412'
alias updatearch='sudo pacman -Qqe > /home/bryson/pkglist.txt; sudo tar -cjf /home/bryson/pacman_database.tar.bz2 /var/lib/pacman/local; sudo pacman -Syu; sudo paccache -rk 1;'

alias sublime="LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 subl"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

source ~/.profile
