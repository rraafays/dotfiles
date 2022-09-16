if not fish_is_root_user
  function emerge --wraps='doas emerge' --description 'emerge=doas emerge'
    doas emerge $argv; 
  end
end
