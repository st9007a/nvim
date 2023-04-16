return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    tag = "0.1.1",
    opts = {
      defaults = {
        prompt_prefix='🔍 ',
      },
    },
  },
}
