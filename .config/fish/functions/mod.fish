function mod
    if test -e .gitmodules
        grep "path|url" .gitmodules | awk '{print $3}' | sed 'N;s/\n/ -> /' | bat -p
    else
        echo "there are no modules!"
    end
end
