#!/bin/bash

all_windows=$(tmux list-panes -aF "#{session_name}|#{window_name}|\"#{pane_current_path}\"|")
IFS="|"
count=0
value=""
for window in $all_windows; do
    if [ $((count%3)) = 0 ]; then
        session=$(echo $window | xargs)
        # echo $session
        value="$value$session;"
    fi
    if [ $((count%3)) = 1 ]; then
        window=$(echo $window)
        # echo $window
        value="$value$window;"
    fi
    if [ $((count%3)) = 2 ]; then
        directory=$(echo $window)
        # echo $directory
        value="$value$directory#"
    fi
    count=$((count+1))
done
echo $value>~/.tmux/.tmux-save
