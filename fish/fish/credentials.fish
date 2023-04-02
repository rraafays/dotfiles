set CREDENTIALS "$FISH_HOME/credentials"
if not test -e $CREDENTIALS; mkdir $CREDENTIALS; end

if not test -e $CREDENTIALS/soulseek.fish; touch $CREDENTIALS/soulseek.fish; end

source $CREDENTIALS/soulseek.fish
