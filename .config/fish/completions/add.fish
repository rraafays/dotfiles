function __fish_git_modified_untracked_files
    git ls-files --others --exclude-standard && git diff --name-only --relative
end

complete -c add -a "(__fish_git_modified_untracked_files)" --no-files
complete -c add -s n -l dry-run -d 'Don\'t actually add the file(s), just show if they exist and/or will be ignored'
complete -c add -s v -l verbose -d 'Be verbose'
complete -c add -s f -l force -d 'Allow adding otherwise ignored files'
complete -c add -l sparse -d 'Allow updating index entries outside of the sparse-checkout cone'
complete -c add -s i -l interactive -d 'Add modified contents in the working tree interactively to the index'
complete -c add -s p -l patch -d 'Interactively choose hunks of patch between the index and the work tree and a…'
complete -c add -s e -l edit -d 'Open the diff vs.  the index in an editor and let the user edit it'
complete -c add -s u -l update -d 'Update the index just where it already has an entry matching <pathspec>'
complete -c add -s A -l all -l no-ignore-removal -d 'Update the index not only where the working tree has a file matching <pathspe…'
complete -c add -l no-all -l ignore-removal -d 'Update the index by adding new files that are unknown to the index and files …'
complete -c add -s N -l intent-to-add -d 'Record only the fact that the path will be added later'
complete -c add -l refresh -d 'Don\'t add the file(s), but only refresh their stat() information in the index'
complete -c add -l ignore-errors -d 'If some files could not be added because of errors indexing them, do not abor…'
complete -c add -l ignore-missing -d 'This option can only be used together with --dry-run'
complete -c add -l no-warn-embedded-repo -d 'By default, git add will warn when adding an embedded repository to the index…'
complete -c add -l renormalize -d 'Apply the "clean" process freshly to all tracked files to forcibly add them a…'
complete -c add -l chmod -d 'Override the executable bit of the added files'
complete -c add -l pathspec-from-file -d 'Pathspec is passed in <file> instead of commandline args'
complete -c add -l pathspec-file-nul -d 'Only meaningful with --pathspec-from-file'
complete -c add -l literal-pathspecs
