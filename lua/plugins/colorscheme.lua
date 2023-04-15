return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
    config = function(lazyplugin, opts)
      require(lazyplugin.name).setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
