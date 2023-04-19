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
  "Cargo.toml",
}

return {
  root_dir = util.root_pattern(table.unpack(root_files)),
}
