local present, util = pcall(require, "lspconfig.util")

if not present then
  return
end

if not table.unpack then
    table.unpack = unpack
end

local home = os.getenv("HOME")

local root_files = {
  ".git",
  ".editorconfig",
  "setup.py",
  "pyproject.toml",
}

return {
  root_dir = util.root_pattern(table.unpack(root_files)),
  settings = {
    python = {
      analysis = {
        typeshedPaths = {
          home .. "/.config/nvim/lib/typeshed",
        },
        stubPath = home .. "/.config/nvim/lib/python-type-stubs",
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
