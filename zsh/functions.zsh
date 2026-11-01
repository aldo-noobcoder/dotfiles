function chpwd(){
    ls -a
}

function mkcd(){
    mkdir $1 && cd $1
}

function copy(){
	\cat $1 |  wl-copy
}

function yd(){
	 yt-dlp \
	    --extractor-args "youtube:player_client=web_embedded" \
        -f "bestvideo[height<=720]+bestaudio/best[height<=720]" \
        --merge-output-format mkv \
        --write-auto-subs \
        --sub-langs "en.*" \
        --embed-subs \
        --embed-thumbnail \
        --embed-metadata \
        --embed-chapters \
        --format-sort "res:720" \
        $argv
}

function yda() {
    yt-dlp \
        -x \
        --extractor-args "youtube:player_client=web_embedded" \
        --embed-thumbnail \
        --add-metadata \
        "$@"
}
function purge() {
    local pkg_name="$1"

    if [[ -z "$pkg_name" ]]; then
        print -P "%F{red}Error: Provide a package name.%f"
        return 1
    fi

    echo "--- Phase 1: Mapping package fingerprints ---"

    local raw
    local -a internal_names
    raw=$(
        pacman -Ql "$pkg_name" |
        grep -E '/usr/bin/|/usr/share/applications/' |
        sed -E 's|.*/||' |
        sed 's/\.desktop//' |
        sort -u
    )
    [[ -n "$raw" ]] && internal_names=("${(@f)raw}") || internal_names=()

    local clean_pkg_name
    clean_pkg_name=$(echo "$pkg_name" | sed -E 's/-(bin|git|lts|pkg|repo|amd64|x86_64)//g')

    local -a search_terms
    raw=$(
        printf "%s\n" "$pkg_name" "$clean_pkg_name" "${internal_names[@]}" |
        sed '/^$/d' |
        sort -u
    )
    [[ -n "$raw" ]] && search_terms=("${(@f)raw}") || search_terms=()

    echo "Identified search terms:"
    printf ' - %s\n' "${search_terms[@]}"

    echo "--- Phase 2: System Uninstall ---"
    sudo pacman -Rs "$pkg_name"

    echo "--- Phase 3: Secure Home Scanning ---"

    local target_dirs=(
        "$HOME/.config"
        "$HOME/.local/share"
        "$HOME/.cache"
        "$HOME/.local/state"
    )

    local term
    for term in "${search_terms[@]}"; do
        term=$(echo "$term" | xargs)
        [[ ${#term} -lt 3 ]] && continue

        local base
        for base in "${target_dirs[@]}"; do
            [[ ! -d "$base" ]] && continue

            local -a matches
            raw=$(find "$base" -maxdepth 2 -iname "*$term*" 2>/dev/null)
            [[ -n "$raw" ]] && matches=("${(@f)raw}") || matches=()

            local match
            for match in "${matches[@]}"; do
                if [[ " ${target_dirs[*]} " == *" $match "* ]]; then
                    continue
                fi

                if [[ -e "$match" ]]; then
                    print -P "%F{yellow}Found residue:%f $match"
                    read "confirm?Delete this item? [y/N] "
                    if [[ "$confirm" =~ ^[Yy]$ ]]; then
                        rm -rf "$match"
                        echo "Wiped safely."
                    fi
                fi
            done
        done

        local -a home_dot
        raw=$(find "$HOME" -maxdepth 1 -type d -name ".*$term*" 2>/dev/null)
        [[ -n "$raw" ]] && home_dot=("${(@f)raw}") || home_dot=()

        local h_match
        for h_match in "${home_dot[@]}"; do
            [[ "$h_match" == "$HOME" ]] && continue

            print -P "%F{yellow}Found hidden home folder:%f $h_match"
            read "confirm?Delete this item? [y/N] "
            if [[ "$confirm" =~ ^[Yy]$ ]]; then
                rm -rf "$h_match"
                echo "Wiped."
            fi
        done
    done

    print -P "%F{green}Deep cleanup complete.%f"
}

function rec() {
    local termlog
    termlog=$(mktemp /tmp/termlog_XXXXXX.txt)
    echo "Recording started. Type 'stop' when done."

    RECORDING=1  script -qfc zsh "$termlog"

    perl ~/.config/zsh/clean_termlog.pl "$termlog" \
        | grep -v '^Script started on' \
        | grep -v '^Script done on' \
        | grep -v '^> stop$' \
        | wl-copy

    rm -f "$termlog"
    echo "Copied to clipboard"
}

function stop() {
    exit
}
