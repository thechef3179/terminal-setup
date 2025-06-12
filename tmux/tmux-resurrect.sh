#!/bin/bash

all_panes=$(cat ~/.tmux/.tmux-save)
IFS="#"

current_session=""
for new_pane in $all_panes; do
    IFS=";" read -ra pane_info<<<"$new_pane"
    session=${pane_info[0]}
    window=${pane_info[1]}
    directory=${pane_info[2]}
    if [ ! "$current_session" = "$session" ]; then
        current_session="$session"
        echo "session name: $current_session"
        window_count=0
        # check if session exists
        tmux has-session -t $session 2>/dev/null
        if [ $? != 0 ]; then
            echo "creating new session $session"
            tmux new-session -d -s $session
            tmux new-window -t $session:$(( window_count+2 )) -n $window -c ${directory//\"/}
            tmux kill-window -t $session:1
            window_count=$(( window_count+1 ))
        else
            tmux new-window -t $session:$(( window_count+1 )) -n $window -c ${directory//\"/}
            window_count=$(( window_count+1 ))
        fi
    else 
        tmux new-window -t $session:$(( window_count+1 )) -n $window -c ${directory//\"/}
        window_count=$(( window_count+1 ))
    fi
done
