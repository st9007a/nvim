if not table.unpack then
    table.unpack = unpack
end

local home = os.getenv("HOME")

local root_files = {
  ".git",
  "setup.py",
  "pyproject.toml",
  ".editorconfig",
}

return {
  root_dir = function (fname)
    local util = require("lspconfig.util")
    local project_dir = util.root_pattern(table.unpack(root_files))(fname)
    return project_dir
  end,
  settings = {
    python = {
      analysis = {
        -- typeshedPaths = {
        --   home .. "/.config/nvim/lib/typeshed",
        -- },
        -- stubPath = home .. "/.config/nvim/lib/python-type-stubs",
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}
