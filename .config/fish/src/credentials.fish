mkdir -p $CREDENTIALS

test -e $CREDENTIALS/openai.fish || echo "set -x OPENAI_API_KEY \"\"" >>$CREDENTIALS/openai.fish
test -e $CREDENTIALS/jira.fish || echo "set -x JIRA_API_TOKEN \"\"" >>$CREDENTIALS/jira.fish

source $CREDENTIALS/openai.fish
source $CREDENTIALS/jira.fish
