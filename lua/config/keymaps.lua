-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Keymaps
keymap.set("n", "<C-y>", "gg<S-v>G")

keymap.set("n", "<S-d>", "<C-d>zz")
keymap.set("n", "<S-u>", "<C-u>zz")

keymap.set("v", "<S-d>", "<C-d>zz")
keymap.set("v", "<S-u>", "<C-u>zz")

-- For escaping insert mode
keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- 0 go to the star and - for the end
keymap.set("n", "0", "^", opts)
keymap.set("n", "-", "$", opts)
keymap.set("n", "d-", "d$") -- `d$` deletes from the cursor to the end of the line
keymap.set("v", "-", "$", opts) -- Added visual mode mapping

-- Move selected linesssssss
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Save with Command + S in normal, insert, and visual modes
keymap.set("n", "<Esc>:w<CR>a", "<Esc>:w<CR>a", { noremap = true, silent = true })

-- Obsidian nvim
keymap.set("n", "<leader>rl", "<cmd>ObsidianLink<CR>", { desc = "Run ObsidianLink" })
keymap.set("n", "<Leader>r", ":w<CR>", { desc = "Save file" })

-- Jump back and forward in jumplist
keymap.set("n", "<leader>9", "<C-o>", { desc = "Go Back in Jump List" })
keymap.set("n", "<leader>0", "<C-i>", { desc = "Go Forward in Jump List" })

-- go to impl
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
