return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim", },
    keys = {
      { "<leader>ff",       "<cmd>Telescope find_files<cr>", desc = "search through project files" },
      { "<leader><leader>", "<cmd>Telescope find_files<cr>", desc = "search through project files" },
      { "<leader>bb",       "<cmd>Telescope buffers<cr>",    desc = "Show opened buffers" },
      { "<leader>sp",       "<cmd>Telescope live_grep<cr>",  desc = "Search text in all project's files" },
      -- { "<leader>cs",       "<cmd>Telescope lsp_document_symbols<cr>",  desc = "Show current documents symbols" },
      -- { "<leader>cS",       "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Show project's symbols" },
      { "<leader>cp",       "<cmd>Telescope luasnip<cr>",    desc = "Show all snippets" },
    },
    opts = {
      pickers = {
        find_files = {
          prompt_prefix = "󰍉 ",
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
        lsp_workspace_symbols = {
          theme = "ivy",
        },
        lsp_document_symbols = {
          theme = "ivy",
        },
        luasnip = {
          theme = "ivy",
        }
      },
      extensions = {
        switch = {
          matchers = {
            -- Elixir matchers
            {
              name = "elixir code to test",
              from = "(.*).ex",
              to = "%1_test.exs",
              ignore_by = { "elixir test to code" }
            },
            {
              name = "elixir test to code",
              from = "%1_test.exs",
              to = "(.*).ex",
            }
          }
        }
      }
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = true,
    build = "make",
    dependencies = { { "nvim-telescope/telescope.nvim" } },
    config = function()
      require('telescope').load_extension("fzf")
    end
  },
  {
    "benfowler/telescope-luasnip.nvim",
    lazy = true,
    dependencies = { { "nvim-telescope/telescope.nvim" } },
    config = function()
      require('telescope').load_extension("luasnip")
    end
  },
  {
    "sshelll/telescope-switch.nvim",
    lazy = true,
    dependencies = { { "nvim-telescope/telescope.nvim" } },
    config = function()
      require('telescope').load_extension("switch")
    end
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    config = function()
      require("telescope").load_extension("projects")
    end
  },
  {
    "folke/trouble.nvim",
    opts = {
      auto_close = true,
      keys = {
        ["<cr>"] = "jump_close"
      }
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>cS",
        "<cmd>Trouble lsp_document_symbols toggle win.position=right<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cd",
        "<cmd>Trouble lsp_definitions toggle<cr>",
        desc = "LSP Definitions (Trouble)",
      },
      {
        "<leader>cr",
        "<cmd>Trouble lsp_references toggle focus=true<cr>",
        desc = "LSP References (Trouble)",
      },
      {
        "gd",
        "<cmd>Trouble lsp_definitions toggle<cr>",
        desc = "LSP Definitions (Trouble)",
      },
      {
        "gS",
        "<cmd>Trouble lsp_document_symbols toggle win.position=right<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "gr",
        "<cmd>Trouble lsp_references toggle focus=true<cr>",
        desc = "LSP References (Trouble)",
      }
    },
  }
}
