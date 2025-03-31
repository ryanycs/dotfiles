-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jk", "<Esc>") -- jk to escape
vim.keymap.set("i", "JK", "<Esc>") -- JK to escape

-- Windows like keybindings
vim.keymap.set("n", "<C-v>", '"*p') -- Paste from system clipboard
vim.keymap.set("v", "<C-c>", '"+y') -- Copy to system clipboard
if vim.fn.has("win32") == 1 then
  vim.keymap.set("i", "<C-v>", "<C-r>+") -- Paste from system clipboard
  vim.keymap.set({ "n", "i" }, "<C-z>", "u") -- Undo
end

-- Copilot
vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
