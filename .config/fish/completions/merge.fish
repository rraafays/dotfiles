complete -c merge -l commit -l no-commit -d 'Perform the merge and commit the result'
complete -c merge -l edit -s e -l no-edit -d 'Invoke an editor before committing successful mechanical merge to further edi…'
complete -c merge -l cleanup -d 'This option determines how the merge message will be cleaned up before commit…'
complete -c merge -l ff -l no-ff -l ff-only -d 'Specifies how a merge is handled when the merged-in history is already a desc…'
complete -c merge -s S -l gpg-sign -l no-gpg-sign -d 'GPG-sign the resulting merge commit'
complete -c merge -l log -l no-log -d 'In addition to branch names, populate the log message with one-line descripti…'
complete -c merge -l signoff -l no-signoff -d 'Add a Signed-off-by trailer by the committer at the end of the commit log mes…'
complete -c merge -l stat -s n -l no-stat -d 'Show a diffstat at the end of the merge'
complete -c merge -l squash -l no-squash -d 'Produce the working tree and index state as if a real merge happened (except …'
complete -c merge -l verify -d 'By default, the pre-merge and commit-msg hooks are run'
complete -c merge -s s -l strategy -d 'Use the given merge strategy; can be supplied more than once to specify them …'
complete -c merge -s X -l strategy-option -d 'Pass merge strategy specific option through to the merge strategy'
complete -c merge -l verify-signatures -l no-verify-signatures -d 'Verify that the tip commit of the side branch being merged is signed with a v…'
complete -c merge -l summary -l no-summary -d 'Synonyms to --stat and --no-stat; these are deprecated and will be removed in…'
complete -c merge -s q -l quiet -d 'Operate quietly.  Implies --no-progress'
complete -c merge -s v -l verbose -d 'Be verbose'
complete -c merge -l progress -l no-progress -d 'Turn progress on/off explicitly'
complete -c merge -l autostash -l no-autostash -d 'Automatically create a temporary stash entry before the operation begins, rec…'
complete -c merge -l allow-unrelated-histories -d 'By default, git merge command refuses to merge histories that do not share a …'
complete -c merge -s m -d 'Set the commit message to be used for the merge commit (in case one is create…'
complete -c merge -l into-name -d 'Prepare the default merge message as if merging to the branch <branch>, inste…'
complete -c merge -s F -l file -d 'Read the commit message to be used for the merge commit (in case one is creat…'
complete -c merge -l rerere-autoupdate -l no-rerere-autoupdate -d 'After the rerere mechanism reuses a recorded resolution on the current confli…'
complete -c merge -l overwrite-ignore -l no-overwrite-ignore -d 'Silently overwrite ignored files from the merge result'
complete -c merge -l abort -d 'Abort the current conflict resolution process, and try to reconstruct the pre…'
complete -c merge -l quit -d 'Forget about the current merge in progress'
complete -c merge -l continue -d 'After a git merge stops due to conflicts you can conclude the merge by runnin…'
complete -c merge -l no-verify -d 'is given, these are bypassed.  See also githooks(5)'
complete -c merge -s b
complete -c merge -s w
complete -c merge -l ignore-space-at-eol
complete -c merge -l ignore-cr-at-eol -d 'oc o 2. 3'
complete -c merge -l find-renames -d 'rename-threshold=<n>'
complete -c merge -l diff-algorithm -d 'ort specifically uses diff-algorithm=histogram, while recursive defaults to t…'
complete -c merge -l no-renames -d resolve
