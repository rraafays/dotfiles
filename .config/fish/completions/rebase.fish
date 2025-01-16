complete -c rebase -l onto -d 'Starting point at which to create the new commits'
complete -c rebase -l keep-base -d 'Set the starting point at which to create the new commits to the merge base o…'
complete -c rebase -l apply -d 'Use applying strategies to rebase (calling git-am internally)'
complete -c rebase -l no-keep-empty -l keep-empty -d 'Do not keep commits that start empty before the rebase (i. e'
complete -c rebase -l reapply-cherry-picks -l no-reapply-cherry-picks -d 'Reapply all clean cherry-picks of any upstream commit instead of preemptively…'
complete -c rebase -l allow-empty-message -d No-op
complete -c rebase -s m -l merge -d 'Using merging strategies to rebase (default)'
complete -c rebase -s s -l strategy -d 'Use the given merge strategy, instead of the default ort'
complete -c rebase -s X -l strategy-option -d 'Pass the <strategy-option> through to the merge strategy'
complete -c rebase -l rerere-autoupdate -l no-rerere-autoupdate -d 'After the rerere mechanism reuses a recorded resolution on the current confli…'
complete -c rebase -s S -l gpg-sign -l no-gpg-sign -d 'GPG-sign commits'
complete -c rebase -s q -l quiet -d 'Be quiet.  Implies --no-stat'
complete -c rebase -s v -l verbose -d 'Be verbose.  Implies --stat'
complete -c rebase -l stat -d 'Show a diffstat of what changed upstream since the last rebase'
complete -c rebase -s n -l no-stat -d 'Do not show a diffstat as part of the rebase process'
complete -c rebase -l no-verify -d 'This option bypasses the pre-rebase hook.  See also githooks(5)'
complete -c rebase -l verify -d 'Allows the pre-rebase hook to run, which is the default'
complete -c rebase -o 'C<n>' -d 'Ensure at least <n> lines of surrounding context match before and after each …'
complete -c rebase -l no-ff -l force-rebase -s f -d 'Individually replay all rebased commits instead of fast-forwarding over the u…'
complete -c rebase -l fork-point -l no-fork-point -d 'Use reflog to find a better common ancestor between <upstream> and <branch> w…'
complete -c rebase -l whitespace -d 'This flag is passed to the git apply program (see git-apply(1)) that applies …'
complete -c rebase -l committer-date-is-author-date -d 'Instead of using the current time as the committer date, use the author date …'
complete -c rebase -l ignore-date -l reset-author-date -d 'Instead of using the author date of the original commit, use the current time…'
complete -c rebase -l signoff -d 'Add a Signed-off-by trailer to all the rebased commits'
complete -c rebase -s i -l interactive -d 'Make a list of the commits which are about to be rebased'
complete -c rebase -s r -l rebase-merges -l no-rebase-merges -d 'By default, a rebase will simply drop merge commits from the todo list, and p…'
complete -c rebase -s x -l exec -d 'Append "exec <cmd>" after each line creating a commit in the final history'
complete -c rebase -l root -d 'Rebase all commits reachable from <branch>, instead of limiting them with an …'
complete -c rebase -l autosquash -l no-autosquash -d 'Automatically squash commits with specially formatted messages into previous …'
complete -c rebase -l autostash -l no-autostash -d 'Automatically create a temporary stash entry before the operation begins, and…'
complete -c rebase -l reschedule-failed-exec -l no-reschedule-failed-exec -d 'Automatically reschedule exec commands that failed'
complete -c rebase -l update-refs -l no-update-refs -d 'Automatically force-update any branches that point to commits that are being …'
complete -c rebase -l continue
complete -c rebase -l skip
complete -c rebase -l abort
complete -c rebase -l quit
complete -c rebase -l edit-todo
complete -c rebase -l show-current-patch
complete -c rebase -l empty
complete -c rebase -o i/--interactive -d 'is also specified.  stop, ask'
complete -c rebase -l allow-empty -d 'override flag to git commit, signifying that a user is very intentionally cre…'
complete -c rebase -l ignore-whitespace
complete -c rebase -l ancestry-path -d 'option will keep their original ancestry by default'
complete -c rebase -l squash
complete -c rebase -l fixup
complete -c rebase -s C -d 'are incompatible with the following options: oc o 2. 3'
complete -c rebase -s b
complete -c rebase -s w
complete -c rebase -l ignore-space-at-eol
complete -c rebase -l ignore-cr-at-eol -d 'oc o 2. 3'
complete -c rebase -l find-renames -d 'rename-threshold=<n>'
complete -c rebase -l diff-algorithm -d 'ort specifically uses diff-algorithm=histogram, while recursive defaults to t…'
complete -c rebase -l no-renames -d resolve
complete -c rebase -l -o---O---P---Q -d 'Suppose you want to rebase the side branch starting at "A" to "Q"'
