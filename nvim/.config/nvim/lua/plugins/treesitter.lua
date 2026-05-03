return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'dart',
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
      require("nvim-treesitter").install(opts.ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then
            return
          end


          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

          -- Highlight
          vim.treesitter.start(buf, language)

          -- Indent
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      })
    end
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
