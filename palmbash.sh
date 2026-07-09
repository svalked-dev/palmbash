#!/bin/bash
# palmbash - palm series shell

V="1.0"
echo "palmbash v$V"

HISTFILE=~/.palmbash_history
HISTORY=()
HISTIDX=0

trap 'echo; continue' INT TERM

load_history() {
    [ -f "$HISTFILE" ] && mapfile -t HISTORY < "$HISTFILE"
}

save_history() {
    printf "%s\n" "${HISTORY[@]}" > "$HISTFILE"
}

load_history

while :; do
    h=$(date +%-H)
    if [ $h -ge 6 ] && [ $h -lt 12 ]; then
        c=32
    elif [ $h -ge 12 ] && [ $h -lt 18 ]; then
        c=33
    elif [ $h -ge 18 ] && [ $h -lt 23 ]; then
        c=34
    else
        c=35
    fi
    
    echo -ne "\033[${c}m>\033[0m "
    read -r -e r
    code=$?
    
    [ $code -ne 0 ] && echo && continue
    [ -z "$r" ] && continue
    
    HISTORY+=("$r")
    HISTIDX=${#HISTORY[@]}
    
    case "$r" in
        exit|quit)
            save_history
            break
            ;;
        history)
            for i in "${!HISTORY[@]}"; do
                printf "%4d  %s\n" $((i+1)) "${HISTORY[i]}"
            done
            ;;
        cd)
            cd "$HOME"
            ;;
        cd\ *)
            eval "cd ${r#cd }" 2>/dev/null || echo "cd: no such dir"
            ;;
        help)
            echo "palmbash commands: exit, quit, history, help"
            echo "any other command runs in subshell"
            ;;
        *)
            if [[ "$r" =~ ^[[:space:]]*$ ]]; then
                continue
            fi
            eval "$r" 2>&1
            ;;
    esac
done
