function lf --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
    z "$(command lf -print-last-dir $argv)"
end
