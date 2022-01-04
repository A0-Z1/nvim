-- this toggles virtual text. Can be easily modified to
-- remove diagnostics altogether
vim.g.diagnostics_active = false
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.config({virtual_text = false})
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.config({virtual_text = true})
  end
end

-- This will switch between virtual text and floating window diagnostic
vim.cmd([[augroup LSP
    autocmd!
    autocmd CursorHold * lua if vim.g.diagnostics_active == false then vim.diagnostic.open_float(0, {scope = "cursor", focusable = false}) end
augroup END]])

vim.api.nvim_set_keymap('n', '<leader>vt', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
