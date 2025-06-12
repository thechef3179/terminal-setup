#!/bin/bash

all_panes=$(cat ~/.tmux/.tmux-save)
IFS="#"

current_session=""
for new_pane in $all_panes; do
    # echo $new_pane
    IFS=";" read -ra pane_info<<<"$new_pane"
    session=${pane_info[0]}
    window=${pane_info[1]}
    directory=${pane_info[2]}
    if [ ! "$current_session" = "$session" ]; then
        # echo $session
        current_session="$session"
        window_count=0
        echo "creating new session $session"
        # tmux new-session -d -s $session
        tmux new-window -t $session:$(( window_count+1 )) -n $window -c $directory
        window_count=$(( window_count+1 ))
    else 
        tmux new-window -t $session:$(( window_count+1 )) -n $window -c ${directory//\"/}
        window_count=$(( window_count+1 ))
        # tmux new-window -t $session: -n $window -c $directory
    fi
    # echo "creating new window $window in $directory"
done
