histfile=${HISTFILE:-~/.bash_history}
history -w; if [[ -f $histfile ]]; then
  if tmp=$(mktemp) && tac "$HISTFILE" | awk '!a[$0]++' | tac > "$tmp"; then
    history -c; history -w
    mv "$tmp" "$histfile"
    history -r
  fi
fi
