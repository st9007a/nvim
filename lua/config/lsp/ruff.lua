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
  "setup.py",
  "pyproject.toml",
}

local on_attach = function(client, bufnr)
  if client.name == 'ruff' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

return {
  root_dir = util.root_pattern(table.unpack(root_files)),
  on_attach = on_attach,
}
