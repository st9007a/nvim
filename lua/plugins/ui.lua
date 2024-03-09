-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

return {
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "v3.*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
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
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      window = {
        mappings = {
          ["a"] = {
            "add",
            config = {
              show_path = "none" -- "none", "relative", "absolute"
            }
          },
          ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
          -- ["c"] = {
          --  "copy",
          --  config = {
          --    show_path = "none" -- "none", "relative", "absolute"
          --  }
          --}
          ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
          ["q"] = "close_window",
          ["R"] = "refresh",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
        }
      },
      filesystem = {
        use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                        -- instead of relying on nvim autocmd events.
      },
    },
  },

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   main = "nvim-tree",
  --   cmd = "NvimTreeToggle",
  --   opts = {
  --     filters = {
  --       dotfiles = false,
  --     },
  --     disable_netrw = true,
  --     hijack_netrw = true,
  --     hijack_cursor = true,
  --     hijack_unnamed_buffer_when_opening = false,
  --     update_cwd = true,
  --     git = {
  --       enable = false,
  --       ignore = false,
  --     },
  --     view = {
  --       width = 25,
  --     },
  --     actions = {
  --       open_file = {
  --         resize_window = false,
  --       },
  --     },
  --     filesystem_watchers = {
  --       enable = true,
  --     },
  --     renderer = {
  --       root_folder_label = false,
  --       icons = {
  --         show = {
  --           git = false,
  --         },
  --       },
  --     },
  --   },
  -- },
}
