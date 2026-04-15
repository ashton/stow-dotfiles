return {
  {
    'DrKJeff16/project.nvim',
    cmd = { -- Lazy-load by commands
      'Project',
      'ProjectAdd',
      'ProjectConfig',
      'ProjectDelete',
      'ProjectExport',
      'ProjectHealth',
      'ProjectHistory',
      'ProjectImport',
      'ProjectRecents',
      'ProjectRoot',
      'ProjectSession',
      'ProjectTelescope', -- If using `telescope.nvim` integration
    },
    dependencies = {      -- OPTIONAL. Choose any of the following
      { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    opts = {
      patterns = { ".project" }
    },
    config = function(_, opts)
      require('project').setup(opts)
      require('telescope').load_extension('projects')
    end,
    keys = {
      { "<leader>pp", "<cmd>Telescope projects<CR>", desc = "List recent projects" }
    },
  },
}
