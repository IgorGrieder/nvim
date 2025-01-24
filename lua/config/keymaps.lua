-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Keymaps
keymap.set("n", "<C-y>", "gg<S-v>G")

keymap.set("n", "<S-d>", "<C-d>zz")
keymap.set("n", "<S-u>", "<C-u>zz")

-- For escaping insert mode
keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- 0 go to the star and - for the end
keymap.set("n", "0", "^", opts)
keymap.set("n", "-", "$", opts)
keymap.set("n", "d-", "d$") -- `d$` deletes from the cursor to the end of the line
keymap.set("v", "-", "$", opts) -- Added visual mode mapping

-- Rename words in normal mode
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

-- Move selected linesssssss
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
