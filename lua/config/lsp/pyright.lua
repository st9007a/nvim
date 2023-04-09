local home = os.getenv('HOME')

return {
  settings = {
    python = {
      analysis = {
        typeshedPaths = {
          home .. '/.config/nvim/lib/typeshed',
        },
        stubPath = home .. '/.config/nvim/lib/python-type-stubs',
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
}
