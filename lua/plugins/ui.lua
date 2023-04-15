vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    version = "v3.*",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        themable = true,
        show_buffer_close_icons = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {},
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    main = "nvim-tree",
    cmd = "NvimTreeToggle",
    opts = {
      filters = {
        dotfiles = false,
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      git = {
        enable = false,
        ignore = false,
      },
      view = {
        width = 25,
        mappings = {
          list = {
              { key = 'v', action = 'vsplit' },
              { key = 's', action = 'split' },
              { key = 'rm', action = 'remove' },
              { key = 'dd', action = 'cut' },
              { key = 'yy', action = 'copy' },
          },
        },
      },
      actions = {
        open_file = {
          resize_window = false,
        },
      },
      filesystem_watchers = {
        enable = true,
      },
      renderer = {
        root_folder_label = false,
        icons = {
          show = {
            git = false,
          },
          glyphs = {
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "-",
              arrow_closed = "+",
            },
          },
        },
      },
    },
  },
}
