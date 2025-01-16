complete -c init -s q -l quiet -d 'Only print error and warning messages; all other output will be suppressed'
complete -c init -l bare -d 'Create a bare repository'
complete -c init -l object-format -d 'Specify the given object <format> (hash algorithm) for the repository'
complete -c init -l ref-format -d 'Specify the given ref storage <format> for the repository'
complete -c init -l template -d 'Specify the directory from which templates will be used'
complete -c init -l separate-git-dir -d 'Instead of initializing the repository as a directory to either $GIT_DIR or '
complete -c init -s b -l initial-branch -d 'Use <branch-name> for the initial branch in the newly created repository'
complete -c init -l shared
