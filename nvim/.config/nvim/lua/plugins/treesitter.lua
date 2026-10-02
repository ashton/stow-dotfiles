return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'dart',
        'elixir',
        'heex',
        'eex',
        'elm',
        'fsharp',
        'graphql',
        'html',
        'javascript',
        'json',
        'markdown',
        'markdown_inline',
        'lua',
        'python',
        'regex',
        'rust',
        'svelte',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'vue',
        'yaml',
        'dap_repl'
      },
    },
    config = function(_, opts)
      local nvim_ts = require("nvim-treesitter")
      nvim_ts.setup()

      for _, ft in ipairs(opts.ensure_installed) do
        local lang = vim.treesitter.language.get_lang(ft)

        if not vim.treesitter.language.add(lang) then
          local available = vim.g.ts_available
              or nvim_ts.get_available()
          if not vim.g.ts_available then
            vim.g.ts_available = available
          end
          if vim.tbl_contains(available, lang) then
            nvim_ts.install(lang)
          end
        end
      end
    end
  },
  {
    "nkrkv/nvim-treesitter-rescript",
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = true

      -- Or, disable per filetype (add as you like)
      -- vim.g.no_python_maps = true
      -- vim.g.no_ruby_maps = true
      -- vim.g.no_rust_maps = true
      -- vim.g.no_go_maps = true
    end,
    opts = true,
    keys = {
      { "]a", function() require "nvim-treesitter-textobjects.move".goto_next_start("@parameter.inner", "textobjects") end,     desc = "goto next parameter" },
      { "[a", function() require "nvim-treesitter-textobjects.move".goto_previous_start("@parameter.inner", "textobjects") end, desc = "goto previous parameter" },
      { "]f", function() require "nvim-treesitter-textobjects.move".goto_next_start("@function.outer", "textobjects") end,      desc = "goto next function" },
      { "[f", function() require "nvim-treesitter-textobjects.move".goto_previous_start("@function.outer", "textobjects") end,  desc = "goto previous function" },
      { "]q", function() require "nvim-treesitter-textobjects.move".goto_next_start("@string", "highlights") end,               desc = "goto next string" },
      { "]Q", function() require "nvim-treesitter-textobjects.move".goto_next_end("@string", "highlights") end,                 desc = "goto next (end) string" },
      { "[q", function() require "nvim-treesitter-textobjects.move".goto_previous_start("@string", "highlights") end,           desc = "goto previous string" },
      { "[Q", function() require "nvim-treesitter-textobjects.move".goto_previous_end("@string", "highlights") end,             desc = "goto previous (end) string" },
      { "]s", function() require "nvim-treesitter-textobjects.move".goto_next_start("@local.scope", "locals") end,              desc = "goto next scope" },
      { "[s", function() require "nvim-treesitter-textobjects.move".goto_previous_start("@local.scope", "locals") end,          desc = "goto previous scope" },
      { "]z", function() require "nvim-treesitter-textobjects.move".goto_next_start("@fold", "folds") end,                      desc = "goto next fold" },
      { "[z", function() require "nvim-treesitter-textobjects.move".goto_previous_start("@fold", "folds") end,                  desc = "goto previous fold" },
    }
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      }
    }
  },
}
