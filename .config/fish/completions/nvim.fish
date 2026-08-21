# Fish tab completion for nvim.
#
# Git-changed paths (modified, staged, untracked) are listed before ordinary
# filesystem matches. Flag completions from fish's generated man-page script are
# preserved by sourcing that file when this wrapper is installed.
#
# Install: mv nvim.fish ~/.config/fish/completions/nvim.fish
# Depends on: git, fish built-in __fish_complete_path helper.

for path in $fish_complete_path
    set -l candidate "$path/nvim.fish"
    string match -q "$__fish_config_dir/completions" "$path"
    and continue
    test -r "$candidate"
    and source "$candidate"
    and break
end

function __fish_nvim_git_status_desc --argument-names status_xy
    switch $status_xy
        case '??'
            echo 'Untracked file'
        case 'A '
            echo 'Staged new file'
        case 'M ' ' M'
            echo 'Modified file'
        case 'MM'
            echo 'Modified (staged and unstaged)'
        case 'R ' ' R'
            echo 'Renamed file'
        case 'U*'
            echo 'Unmerged file'
        case '*'
            echo 'Git changed'
    end
end

function __fish_nvim_git_files --description 'Git-changed paths matching the current token'
    git rev-parse --is-inside-work-tree >/dev/null 2>&1
    or return

    set -l token (commandline -ct)
    set -l rel ''
    if string match -q './*' -- $token
        set rel './'
        set token (string sub -s 3 $token)
    end

    git -c status.relativePaths=true -c core.quotePath=false status --porcelain 2>/dev/null \
        | while read -l line
        set -l xy (string sub -s 1 -l 2 $line)
        switch $xy
            case 'D ' ' D' 'DD'
                continue
        end

        set -l file (string sub -s 4 $line)
        if string match -qr -- ' -> ' $file
            set file (string replace -r '.* -> ' '' $file)
        end

        if test -n "$token"
            string match -q "$token"* "$file"
            or continue
        end

        set -l desc (__fish_nvim_git_status_desc $xy)
        printf '%s\t%s\n' "$rel$file" "$desc"
    end
end

function __fish_nvim_complete_paths --description 'Git-changed files first, then normal paths'
    set -l seen

    for entry in (__fish_nvim_git_files)
        set -l path (string split -m1 \t -- $entry)[1]
        set -a seen $path
        echo $entry
    end

    for entry in (__fish_complete_path)
        set -l path (string split -m1 \t -- $entry)[1]
        contains -- $path $seen
        and continue
        echo $entry
    end
end

function __fish_nvim_needs_path --description 'True when completing a file path token'
    set -l token (commandline -ct)
    string match -qr -- '^-' $token
    and return 1
    return 0
end

complete --command nvim \
    --condition '__fish_nvim_needs_path' \
    --no-files \
    --keep-order \
    --arguments '(__fish_nvim_complete_paths)'
