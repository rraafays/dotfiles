function emerge --wraps='doas emerge' --description 'emerge=doas emerge'
  doas emerge $argv; 
end
