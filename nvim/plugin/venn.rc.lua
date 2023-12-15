vim.keymap.set("v", "<Left>", "h:VBox<CR><C-v>")
vim.keymap.set("v", "<Down>", "j:VBox<CR><C-v>")
vim.keymap.set("v", "<Up>", "k:VBox<CR><C-v>")
vim.keymap.set("v", "<Right>", "l:VBox<CR><C-v>")
vim.keymap.set('v', '<Space>', ":VBox<CR>")
vim.opt.virtualedit = "block"


-------------------------------------------------------
------------┌────────────┐-----------------------------
------------│            │-----------------------------
------------│  i am box  │-----------------------------
------------│            │-----------------------------
------------└─────┬──────┘-----------------------------
------------------│------------------------------------
------------------└──────┐-----------------------------
-------------------------│-----------------------------
-------------------------│-----------------------------
-------------------┌─────┴─────┐-----------------------
-------------------│ i am son. │-----------------------
-------------------└───────────┘-----------------------
-------------------------------------------------------