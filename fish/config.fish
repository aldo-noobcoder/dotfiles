if not set -q RECORDING
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end
source ~/.config/fish/aliases.fish
source ~/.config/fish/env.fish
source ~/.config/fish/binds.fish



if test (tty) = "/dev/tty1"

    echo "Good day, select your WM:"
    echo "1) Niri"
    echo "2) None"

    read wm_choice

    switch $wm_choice
        case 1
            exec  niri-session
        case 2
            echo "Did nothing yay"
        case '*'
            echo "Invalid option"
    end
end



# overwrite greeting
function fish_greeting
	if not set -q RECORDING
		if ! test "$TERM" = "xterm-kitty" 
        fastfetch --logo CachyOS
        else if  test "$TERM" = "foot"
            fastfetch 
            cd ~/Downloads
        else
        	fastfetch
         end
         ~/Documents/Scripts/quotes
    end

    # fortune wisdom | cowsay
end


function detach
    nohup $argv 2>&1 &
end

function last_history_item -d "Get the last executed item from history"
    history --max=1
end

abbr -a !! --position anywhere --function last_history_item

zoxide init fish | source
# pay-respects fish | source


if set -q RECORDING
    function fish_prompt
        echo -n "> "
    end
else
    starship init fish | source
end

if test -d ~/Floorp; rm -rf ~/Floorp &> /dev/null ; end





function ls_after_cd_on_variable_pwd --on-variable PWD
    ls -G
     echo "$PWD" >> ~/.local/share/fish/fish_dir_history
end

