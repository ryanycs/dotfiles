-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.updatetime = 100
vim.opt.wrap = true

-- terminal on Windows
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "powershell -nologo"
  vim.opt.shellcmdflag = "-command"
  vim.opt.shellxquote = ""
end

-- vscode
if vim.g.vscode then
  local vscode = require("vscode")
  vim.notify = vscode.notify -- use vscode's notify
  vim.opt.showmode = true -- show mode in status bar
end
