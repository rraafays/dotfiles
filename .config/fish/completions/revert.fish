complete -c revert -s e -l edit -d 'With this option, git revert will let you edit the commit message prior to co…'
complete -c revert -s m -l mainline -d 'Usually you cannot revert a merge because you do not know which side of the m…'
complete -c revert -l no-edit -d 'With this option, git revert will not start the commit message editor'
complete -c revert -l cleanup -d 'This option determines how the commit message will be cleaned up before being…'
complete -c revert -s n -l no-commit -d 'Usually the command automatically creates some commits with commit log messag…'
complete -c revert -s S -l gpg-sign -l no-gpg-sign -d 'GPG-sign commits'
complete -c revert -s s -l signoff -d 'Add a Signed-off-by trailer at the end of the commit message'
complete -c revert -l strategy -d 'Use the given merge strategy.  Should only be used once'
complete -c revert -o 'X<option>' -l strategy-option -d 'Pass the merge strategy-specific option through to the merge strategy'
complete -c revert -l rerere-autoupdate -l no-rerere-autoupdate -d 'After the rerere mechanism reuses a recorded resolution on the current confli…'
complete -c revert -l reference -d 'Instead of starting the body of the log message with "This reverts <full-obje…'
complete -c revert -l no-walk -d option
complete -c revert -l continue
complete -c revert -l skip
complete -c revert -l quit
complete -c revert -l abort
