local available_servers = {
  "lua_ls",
  "gopls",
  "pyright",
}

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function(_, opts)
      local has_mason, mlsp = pcall(require, "mason-lspconfig")
      local available = has_mason and mlsp.get_available_servers() or {}

      if not available then
        return
      end

      mlsp.setup({ ensure_installed = available_servers })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      for i = 1, #available_servers do
        local server = available_servers[i]
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, require("config.lsp." .. server) or {})

        lspconfig[server].setup(server_opts)
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "lewis6991/gitsigns.nvim",
    },
    opts = function ()
      local null_ls = require("null-ls")
      local u = require("null-ls.utils")

      return {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.trim_whitespace.with({
            disabled_filetypes = { "rust", "go" },
          }),
          null_ls.builtins.formatting.trim_newlines.with({
            disabled_filetypes = { "rust", "go" },
          }),
          null_ls.builtins.code_actions.gitsigns,
        },
        root_dir = u.root_pattern(
          ".null-ls-root",
          "Makefile",
          ".git",
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "Cargo.toml",
          "go.mod",
          "stylua.toml",
          ".editorconfig"
        ),
      }
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      rename = {
        quit = "<ESC>",
      },
      lightbulb = {
        enable = false,
      },
      outline = {
        keys = {
          expand_or_jump = "<CR>",
          quit = "<ESC>",
        },
      },
    },
  },
}
