complete -c reset -s q -l quiet -d 'Be quiet, only report errors'
complete -c reset -l refresh -l no-refresh -d 'Refresh the index after a mixed reset.  Enabled by default'
complete -c reset -l pathspec-from-file -d 'Pathspec is passed in <file> instead of commandline args'
complete -c reset -l pathspec-file-nul -d 'Only meaningful with --pathspec-from-file'
complete -c reset -l source -d 'git reset (--patch | -p) [<tree-ish>] [--] [<pathspec>. ]'
complete -c reset -l patch -d 'mode.  git reset [<mode>] [<commit>]'
complete -c reset -l mixed -d '<mode> must be one of the following:'
complete -c reset -l soft
complete -c reset -s N -d 'is specified, removed paths are marked as intent-to-add (see git-add(1))'
complete -c reset -l hard
complete -c reset -l merge
complete -c reset -l keep
complete -c reset -l recurse-submodules
complete -c reset -l literal-pathspecs
complete -c reset -s C -d 'option instead'
complete -c reset -l amend -d 'option to git-commit(1)'
complete -c reset -s c -d 'option specifies to pre-populate the commit message from the original message…'
complete -c reset -l -------------------------------------------------- -d ' A       B     C    D     --soft   A       B     D                           …'
