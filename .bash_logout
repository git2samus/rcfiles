[[ -f $HISTFILE ]] && history -a && tmp=$(mktemp) && tac "$HISTFILE" | awk '!a[$0]++' | tac > "$tmp" && mv "$tmp" "$HISTFILE" && history -c
