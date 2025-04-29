function src
    if test -e src
        tree src --color=always | bat -p
    else
        echo "there is no source directory!"
        return 1
    end
end
