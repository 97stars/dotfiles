setopt SHARE_HISTORY

## environment variables
setopt ALL_EXPORT
PATH="/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:$HOME/bin:$PATH"
TZ="America/Toronto"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER="less"
EDITOR="vim"
ALTERNATE_EDITOR="nano"
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color="%{$terminfo[bold]$fg[${(L)color}]%}"
    eval PR_LIGHT_$color="%{$fg[${(L)color}]%}"
    (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"
PS1="[$PR_BLUE%n$PR_CYAN@$PR_GREEN%U%m%u$PR_NO_COLOR:$PR_RED%2c$PR_NO_COLOR]%(!.#.$) "
RPS1="$PR_LIGHT_YELLOW(%D{%m-%d %H-%M})$PR_NO_COLOR"
LC_ALL="en_US.UTF-8"
LANG="en_US.UTF-8"
LC_CTYPE=C
WORKON_HOME=$HOME/.virtualenvs
unsetopt ALL_EXPORT

## pretty ls colors
eval "`dircolors -b`"

## command completion
autoload -U compinit
compinit
zstyle ":completion::complete:*" use-cache on
zstyle ":completion::complete:*" cache-path ~/.zsh/cache/$HOST
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}

## keybindings
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

for k in ${(k)key} ; do
    # $terminfo[] entries are weird in ncurses application mode...
    [[ ${key[$k]} == $'\eO'* ]] && key[$k]=${key[$k]/O/[}
done
unset k

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-search
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-search
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

## aliases
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias ssh="ssh -X"

## external sources
if [[ -f /usr/local/bin/virtualenvwrapper_bashrc ]] ; then
    source /usr/local/bin/virtualenvwrapper_bashrc
fi

fortune -s
