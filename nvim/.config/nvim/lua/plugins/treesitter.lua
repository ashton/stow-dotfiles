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
    dependencies = { "nvim-treesitter/nvim-treesitter" }
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
