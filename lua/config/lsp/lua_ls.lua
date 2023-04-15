local present, util = pcall(require, "lspconfig.util")

if not present then
  return
end

if not table.unpack then
    table.unpack = unpack
end

local root_files = {
  ".git",
  ".editorconfig",
  "stylua.toml",
}

return {
  root_dir = util.root_pattern(table.unpack(root_files)),
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}
