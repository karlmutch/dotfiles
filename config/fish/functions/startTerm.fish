function startTerm
    if tmux has-session
        tmux attach
    else
        tmux new
    end
end
