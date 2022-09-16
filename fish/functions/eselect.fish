if not fish_is_root_user
  function eselect --wraps='doas eselect' --description 'eselect=doas eselect'
    doas eselect $argv; 
  end
end
