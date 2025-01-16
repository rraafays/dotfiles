complete -c log -l follow -d 'Continue listing the history of a file beyond renames (works only for a singl…'
complete -c log -l no-decorate -l decorate -d 'Print out the ref names of any commits that are shown'
complete -c log -l decorate-refs -l decorate-refs-exclude -d 'For each candidate reference, do not use it for decoration if it matches any …'
complete -c log -l clear-decorations -d 'When specified, this option clears all previous --decorate-refs or --decorate…'
complete -c log -l source -d 'Print out the ref name given on the command line by which each commit was rea…'
complete -c log -l mailmap -l use-mailmap -d 'Use mailmap file to map author and committer names and email addresses to can…'
complete -c log -l full-diff -d 'Without this flag, git log -p <path>'
complete -c log -l log-size -d 'Include a line "log size <number>" in the output for each commit, where <numb…'
complete -c log -o 'L<start>' -o 'L:<funcname>:<file>' -d 'Trace the evolution of the line range given by <start>,<end>, or by the funct…'
complete -c log -o '<number>' -s n -l max-count -d 'Limit the number of commits to output'
complete -c log -l skip -d 'Skip number commits before starting to show the commit output'
complete -c log -l since -l after -d 'Show commits more recent than a specific date'
complete -c log -l since-as-filter -d 'Show all commits more recent than a specific date'
complete -c log -l until -l before -d 'Show commits older than a specific date'
complete -c log -l author -l committer -d 'Limit the commits output to ones with author/committer header lines that matc…'
complete -c log -l grep-reflog -d 'Limit the commits output to ones with reflog entries that match the specified…'
complete -c log -l grep -d 'Limit the commits output to ones with a log message that matches the specifie…'
complete -c log -l all-match -d 'Limit the commits output to ones that match all given --grep, instead of ones…'
complete -c log -l invert-grep -d 'Limit the commits output to ones with a log message that do not match the pat…'
complete -c log -s i -l regexp-ignore-case -d 'Match the regular expression limiting patterns without regard to letter case'
complete -c log -l basic-regexp -d 'Consider the limiting patterns to be basic regular expressions; this is the d…'
complete -c log -s E -l extended-regexp -d 'Consider the limiting patterns to be extended regular expressions instead of …'
complete -c log -s F -l fixed-strings -d 'Consider the limiting patterns to be fixed strings (don\'t interpret pattern a…'
complete -c log -s P -l perl-regexp -d 'Consider the limiting patterns to be Perl-compatible regular expressions'
complete -c log -l remove-empty -d 'Stop when a given path disappears from the tree'
complete -c log -l merges -d 'Print only merge commits.  This is exactly the same as --min-parents=2'
complete -c log -l no-merges -d 'Do not print commits with more than one parent'
complete -c log -l min-parents -l max-parents -l no-min-parents -l no-max-parents -d 'Show only commits which have at least (or at most) that many parent commits'
complete -c log -l first-parent -d 'When finding commits to include, follow only the first parent commit upon see…'
complete -c log -l exclude-first-parent-only -d 'When finding commits to exclude (with a ^), follow only the first parent comm…'
complete -c log -l not -d 'Reverses the meaning of the ^ prefix (or lack thereof) for all following revi…'
complete -c log -l all -d 'Pretend as if all the refs in refs/, along with HEAD, are listed on the comma…'
complete -c log -l branches -d 'Pretend as if all the refs in refs/heads are listed on the command line as <c…'
complete -c log -l tags -d 'Pretend as if all the refs in refs/tags are listed on the command line as <co…'
complete -c log -l remotes -d 'Pretend as if all the refs in refs/remotes are listed on the command line as …'
complete -c log -l glob -d 'Pretend as if all the refs matching shell glob <glob-pattern> are listed on t…'
complete -c log -l exclude -d 'Do not include refs matching <glob-pattern> that the next --all, --branches, …'
complete -c log -l exclude-hidden -d 'Do not include refs that would be hidden by git-fetch, git-receive-pack or gi…'
complete -c log -l reflog -d 'Pretend as if all objects mentioned by reflogs are listed on the command line…'
complete -c log -l alternate-refs -d 'Pretend as if all objects mentioned as ref tips of alternate repositories wer…'
complete -c log -l single-worktree -d 'By default, all working trees will be examined by the following options when …'
complete -c log -l ignore-missing -d 'Upon seeing an invalid object name in the input, pretend as if the bad input …'
complete -c log -l bisect -d 'Pretend as if the bad bisection ref refs/bisect/bad was listed and as if it w…'
complete -c log -l stdin -d 'In addition to getting arguments from the command line, read them from standa…'
complete -c log -l cherry-mark -d 'Like --cherry-pick (see below) but mark equivalent commits with = rather than…'
complete -c log -l cherry-pick -d 'Omit any commit that introduces the same change as another commit on the "oth…'
complete -c log -l left-only -l right-only -d 'List only commits on the respective side of a symmetric difference, i. e'
complete -c log -l cherry -d 'A synonym for --right-only --cherry-mark --no-merges; useful to limit the out…'
complete -c log -s g -l walk-reflogs -d 'Instead of walking the commit ancestry chain, walk reflog entries from the mo…'
complete -c log -l merge -d 'Show commits touching conflicted paths in the range HEAD'
complete -c log -l boundary -d 'Output excluded boundary commits.  Boundary commits are prefixed with -'
complete -c log -l simplify-by-decoration -d 'Commits that are referred by some branch or tag are selected'
complete -c log -l show-pulls -d 'Include all commits from the default mode, but also any merge commits that ar…'
complete -c log -l full-history -d 'Same as the default mode, but does not prune some history'
complete -c log -l dense -d 'Only the selected commits are shown, plus some to have a meaningful history'
complete -c log -l sparse -d 'All commits in the simplified history are shown'
complete -c log -l simplify-merges -d 'Additional option to --full-history to remove some needless merges from the r…'
complete -c log -l ancestry-path -d 'When given a range of commits to display (e. g.  commit1'
complete -c log -l date-order -d 'Show no parents before all of its children are shown, but otherwise show comm…'
complete -c log -l author-date-order -d 'Show no parents before all of its children are shown, but otherwise show comm…'
complete -c log -l topo-order -d 'Show no parents before all of its children are shown, and avoid showing commi…'
complete -c log -l reverse -d 'Output the commits chosen to be shown (see Commit Limiting section above) in …'
complete -c log -l no-walk -d 'Only show the given commits, but do not traverse their ancestors'
complete -c log -l do-walk -d 'Overrides a previous --no-walk'
complete -c log -l pretty -l format -d 'Pretty-print the contents of the commit logs in a given format, where <format…'
complete -c log -l abbrev-commit -d 'Instead of showing the full 40-byte hexadecimal commit object name, show a pr…'
complete -c log -l no-abbrev-commit -d 'Show the full 40-byte hexadecimal commit object name'
complete -c log -l oneline -d 'This is a shorthand for "--pretty=oneline --abbrev-commit" used together'
complete -c log -l encoding -d 'Commit objects record the character encoding used for the log message in thei…'
complete -c log -l expand-tabs -l expand-tabs -l no-expand-tabs -d 'Perform a tab expansion (replace each tab with enough spaces to fill to the n…'
complete -c log -l notes -d 'Show the notes (see git-notes(1)) that annotate the commit, when showing the …'
complete -c log -l no-notes -d 'Do not show notes'
complete -c log -l show-notes-by-default -d 'Show the default notes unless options for displaying specific notes are given'
complete -c log -l show-notes -l standard-notes -d 'These options are deprecated'
complete -c log -l show-signature -d 'Check the validity of a signed commit object by passing the signature to gpg …'
complete -c log -l relative-date -d 'Synonym for --date=relative'
complete -c log -l date -d 'Only takes effect for dates shown in human-readable format, such as when usin…'
complete -c log -l parents -d 'Print also the parents of the commit (in the form "commit parent. ")'
complete -c log -l children -d 'Print also the children of the commit (in the form "commit child. ")'
complete -c log -l left-right -d 'Mark which side of a symmetric difference a commit is reachable from'
complete -c log -l graph -d 'Draw a text-based graphical representation of the commit history on the left …'
complete -c log -l show-linear-break -d 'When --graph is not used, all history branches are flattened which can make i…'
complete -c log -l stat
complete -c log -l patch
complete -c log -l no-patch
complete -c log -l raw
complete -c log -l numstat
complete -c log -l shortstat
complete -c log -l dirstat
complete -c log -l summary
complete -c log -l name-only
complete -c log -l name-status
complete -c log -l check
complete -c log -s L -d 'range, if any, otherwise from the start of file'
complete -c log -s 1 -d '(negative numbers denote no upper limit)'
complete -c log -l diff-merges -d 'for details'
complete -c log -l indexed-objects
complete -c log -l 'no-merges;' -d 'git log --cherry upstream. mybranch, similar to git cherry upstream mybranch'
complete -c log -o local -d 'is appended to the format (e. g'
complete -c log -l no-abbrev -d 'oc o 2. 3'
complete -c log -l color -d 'auto settings of the former if we are going to a terminal).  %C(auto,'
complete -c log -l unfold -d 'option was given.  E. g'
complete -c log -s p -s u
complete -c log -s s
complete -c log -s m
complete -c log -s c
complete -c log -l cc
complete -c log -l dd
complete -c log -l remerge-diff
complete -c log -l no-diff-merges
complete -c log -l combined-all-paths
complete -c log -o 'U<n>' -l unified
complete -c log -l output
complete -c log -l output-indicator-new -l output-indicator-old -l output-indicator-context
complete -c log -l patch-with-raw
complete -c log -s t
complete -c log -l indent-heuristic
complete -c log -l no-indent-heuristic
complete -c log -l minimal
complete -c log -l patience
complete -c log -l histogram
complete -c log -l anchored
complete -c log -l diff-algorithm
complete -c log -l stat-graph-width -d 'or by setting diff. statGraphWidth=<width>.  Using'
complete -c log -l stat-width
complete -c log -l stat-name-width -d and
complete -c log -l stat-count
complete -c log -l compact-summary
complete -c log -o 'X[<param1'
complete -c log -l '*stat' -d 'options.  files'
complete -c log -l cumulative
complete -c log -l dirstat-by-file
complete -c log -l patch-with-stat
complete -c log -s z
complete -c log -l diff-filter -d 'option on what the status letters mean.  Just like'
complete -c log -l submodule
complete -c log -l no-color
complete -c log -l color-moved
complete -c log -l no-color-moved
complete -c log -l color-moved-ws
complete -c log -l no-color-moved-ws
complete -c log -l word-diff
complete -c log -l word-diff-regex -d 'below.  The <mode> defaults to plain, and must be one of:'
complete -c log -l color-words
complete -c log -l no-renames
complete -c log -l rename-empty
complete -c log -l ws-error-highlight
complete -c log -l full-index
complete -c log -l binary
complete -c log -l abbrev
complete -c log -s B -l break-rewrites
complete -c log -o 'B/70%' -d 'specifies that less than 30% of the original should remain in the result for …'
complete -c log -o 'B20%' -d 'specifies that a change with addition and deletion compared to 20% or more of…'
complete -c log -s M -l find-renames
complete -c log -o 'M90%' -d 'means Git should consider a delete/add pair to be a rename if more than 90% o…'
complete -c log -o M5 -d 'becomes 0. 5, and is thus the same as'
complete -c log -o 'M50%'
complete -c log -o M05 -d 'is the same as'
complete -c log -o 'M5%'
complete -c log -o 'M100%'
complete -c log -s C -l find-copies
complete -c log -l find-copies-harder -d 'n is specified, it has the same meaning as for'
complete -c log -o 'M<n>'
complete -c log -s D -l irreversible-delete
complete -c log -o 'l<num>'
complete -c log -o 'S<string>'
complete -c log -s S
complete -c log -o 'G<regex>'
complete -c log -o 'S<regex>' -l pickaxe-regex -d and
complete -c log -l text -d 'is supplied patches of binary files without a textconv filter will be ignored'
complete -c log -l find-object
complete -c log -l pickaxe-all
complete -c log -s G -d 'finds a change, show all the changes in that changeset, not just the files th…'
complete -c log -o 'O<orderfile>'
complete -c log -o O/dev/null
complete -c log -l skip-to -l rotate-to
complete -c log -s R
complete -c log -l relative -l no-relative
complete -c log -s a
complete -c log -l ignore-cr-at-eol
complete -c log -l ignore-space-at-eol
complete -c log -s b -l ignore-space-change
complete -c log -s w -l ignore-all-space
complete -c log -l ignore-blank-lines
complete -c log -o 'I<regex>' -l ignore-matching-lines
complete -c log -l inter-hunk-context
complete -c log -s W -l function-context
complete -c log -l ext-diff
complete -c log -l no-ext-diff
complete -c log -l textconv -l no-textconv
complete -c log -l ignore-submodules
complete -c log -l src-prefix
complete -c log -l dst-prefix
complete -c log -l no-prefix
complete -c log -l default-prefix
complete -c log -l line-prefix
complete -c log -l ita-invisible-in-index
complete -c log -l ita-visible-in-index -d 'For more detailed explanation on these common options, see also gitdiffcore(7)'
complete -c log -l - -d '+++ b/describe'
complete -c log -l no-use-mailmap -d 'notes. mergeStrategy'
complete -c log -l strategy -d 'option to git-notes(1).  notes. <name>. mergeStrategy'
