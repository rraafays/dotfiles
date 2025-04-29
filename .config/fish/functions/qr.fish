function qr
    nix-shell --packages qrencode --run "qrencode -t UTF8 -m 2 '$argv'"
end
