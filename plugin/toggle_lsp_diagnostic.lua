vim.g.diagnostics_active = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.hide(nil, 0)
    -- print("Hiding diagnostics")
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.show(nil, 0)
    -- print("Showing diagnostics")
  end
end

vim.api.nvim_set_keymap('n', '<leader>tt', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
