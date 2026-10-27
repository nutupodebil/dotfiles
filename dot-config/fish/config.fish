
if status is-interactive
    # Commands to run in interactive sessions can go here

    set -g fish_greeting ""

    #fastfetch 

    #set -U tide_character_vi_icon_default '❯'

    abbr -a ff fastfetch
    abbr -a la lsd -Al
    abbr -a ls lsd
    abbr -a lt lsd --tree
    abbr -a cat bat

    abbr -a psyu sudo pacman -Syu
    abbr -a ysyu yay -Syu

    abbr -a pss pacman -Ss
    abbr -a yss yay -Ss
end

#function starship_transient_prompt_func
#    echo -n "~> "
#end

#starship init fish | source

#enable_transience
