set CREDENTIALS "$FISH_HOME/credentials"
if not test -e $CREDENTIALS; mkdir $CREDENTIALS; end

if not test -e $CREDENTIALS/soulseek.fish
  echo "set -x SOULSEEK_ACCOUNT \"\"" >> $CREDENTIALS/soulseek.fish
  echo "set -x SOULSEEK_PASSWORD \"\"" >> $CREDENTIALS/soulseek.fish
end

source $CREDENTIALS/soulseek.fish
