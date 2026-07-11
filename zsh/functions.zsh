function chpwd(){
    ls -a
}

function mkcd(){
    mkdir $1 && cd $1
}




# Deep clean package residue with directory-only filters
function purge() {
    local pkg_name="$1"

    # 1. Validation
    if [[ -z "$pkg_name" ]]; then
        print -P "%F{red}Error: Provide a package name.%f"
        return 1
    fi
#
#     if ! pacman -Qi "$pkg_name" >/dev/null 2>&1; then
#         print -P "%F{red}Error: '$pkg_name' not found.%f"
#         return 1
#     fi

    # 2. Intelligence Gathering
    echo "--- Phase 1: Mapping package fingerprints ---"

    local internal_names
    internal_names=("${(@f)$(
        pacman -Ql "$pkg_name" |
        grep -E '/usr/bin/|/usr/share/applications/' |
        sed -E 's|.*/||' |
        sed 's/\.desktop//' |
        sort -u
    )}")

    local clean_pkg_name
    clean_pkg_name=$(echo "$pkg_name" | sed -E 's/-(bin|git|lts|pkg|repo|amd64|x86_64)//g')

    local search_terms
    search_terms=("${(@f)$(
        printf "%s\n" "$pkg_name" "$clean_pkg_name" "${internal_names[@]}" |
        sort -u
    )}")

    echo "Identified search terms:"
    printf ' - %s\n' "${search_terms[@]}"

    # 3. System Uninstall
    echo "--- Phase 2: System Uninstall ---"

    sudo pacman -Rs "$pkg_name"

    # 4. Targeted Home Scanning
    echo "--- Phase 3: Secure Home Scanning ---"

    local target_dirs=(
        "$HOME/.config"
        "$HOME/.local/share"
        "$HOME/.cache"
        "$HOME/.local/state"
        "$HOME/.mozilla"
        "$HOME/.var/app"
    )

    local term
    for term in "${search_terms[@]}"; do
        term=$(echo "$term" | xargs)

        [[ ${#term} -lt 3 ]] && continue

        local base
        for base in "${target_dirs[@]}"; do
            [[ ! -d "$base" ]] && continue

            local matches
            matches=("${(@f)$(
                find "$base" -maxdepth 2 -iname "*$term*" 2>/dev/null
            )}")

            local match
            for match in "${matches[@]}"; do

                # Skip exact target dirs themselves
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

        # Hidden folders directly in $HOME
        local home_dot
        home_dot=("${(@f)$(
            find "$HOME" -maxdepth 1 -type d -name ".*$term*" 2>/dev/null
        )}")

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
