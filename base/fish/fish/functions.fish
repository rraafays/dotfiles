function snake
  perl -pe 's#([A-Z])#_\L$1#g' | perl -pe 's#^_##'
end
