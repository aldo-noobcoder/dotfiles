bind \e\[1\;7D "prevd; echo; commandline -f repaint;"
bind \e\[1\;7C "nextd; echo; commandline -f repaint;"
bind \e\[1\;7A "cd ..; echo; commandline -f repaint;"
bind \e\[1\;7B "prevd; echo; commandline -f repaint;"
bind \cr fzf-history-widget
bind \cf search
bind \ce scd
bind \e\cf search-contents
stty intr \^C
