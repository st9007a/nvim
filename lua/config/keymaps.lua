-- switch between windows
vim.keymap.set("n", "<Tab>", "<C-w>w")

vim.keymap.set("n", "`", ":Neotree toggle position=current<CR>")

-- Telescope.nvim key bindings
vim.keymap.set("n", "<space>b", ":Telescope buffers<CR>")
vim.keymap.set("n", "<space>s", ":Telescope find_files<CR>")
vim.keymap.set("n", "<space>g", ":Telescope live_grep<CR>")

local M = {}

M.setup_lsp_keymap = function(ev)
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

  vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)

  vim.keymap.set("n", "<leader>r", ":Lspsaga rename<CR>", opts)
  vim.keymap.set("n", "<leader>a", ":Lspsaga code_action<CR>", opts)
  vim.keymap.set("n", "<leader>l", ":Lspsaga finder<CR>", opts)
  vim.keymap.set("n", "<leader>t", ":Lspsaga outline<CR>", opts)
  vim.keymap.set("n", "<leader>e", ":Lspsaga show_line_diagnostics<CR>", opts)
  vim.keymap.set("n", "<leader>d", ":Lspsaga show_buf_diagnostics<CR>", opts)
  vim.keymap.set("n", "<leader>i", ":Lspsaga incoming_calls<CR>", opts)
  vim.keymap.set("n", "<leader>o", ":Lspsaga outgoing_calls<CR>", opts)
  vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
  vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts)

  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

return M
