return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        'bash',
        'elixir',
        'heex',
        'eex',
        'elm',
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
      require('nvim-treesitter').install(opts.ensure_installed)
    end
  },
  {
    "nkrkv/nvim-treesitter-rescript",
    enabled = false,
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
