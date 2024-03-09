return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    tag = "0.1.5",
    opts = {
      defaults = {
        prompt_prefix = '🔍 ',
      },
    },
    config = function (lazyplugin, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
