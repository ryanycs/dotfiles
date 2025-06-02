-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

if vim.g.vscode then
  vim.api.nvim_exec2(
    [[
        " THEME CHANGER
        function! SetCursorLineNrColorInsert(mode)
            " Insert mode: blue
                if a:mode == "i"
                        call VSCodeNotify('nvim-theme.insert')

            " Replace mode: red
            elseif a:mode == "r"
                call VSCodeNotify('nvim-theme.replace')
            endif
        endfunction

        augroup CursorLineNrColorSwap
            autocmd!
            autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
            autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
            autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
            autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
            autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
            autocmd ModeChanged [vV\x16]*:* call VSCodeNotify('nvim-theme.normal')
        augroup END
    ]],
    { output = false }
  )
end
