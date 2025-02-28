function edit
    $EDITOR $argv
end
function plan
    if test -z "$argv"
        $PLANNER TODO.md
    else
        $PLANNER $argv
    end
end
