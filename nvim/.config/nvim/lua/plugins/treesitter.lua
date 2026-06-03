local function is_parser_installed(lang)
  local installed = require("nvim-treesitter").get_installed()
  return vim.tbl_contains(installed, lang)
end

local function is_parser_available(lang)
  local available = require("nvim-treesitter").get_available()
  return vim.tbl_contains(available, lang)
end

local function start_treesitter(buf, lang)
  if not vim.treesitter.language.add(lang) then
    vim.notify(
      "Cannot load treesitter parser for language " .. lang,
      vim.log.levels.WARN
    )
    return
  end
  vim.treesitter.start(buf)
  vim.bo[buf].syntax = "ON"
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then
      return
    end
    local buf = ev.buf
    if is_parser_installed(lang) then
      start_treesitter(buf, lang)
    elseif is_parser_available(lang) then
      require("nvim-treesitter").install({ lang }):await(function()
        start_treesitter(buf, lang)
      end)
    end
  end,
})

return {
  {
    'neovim-treesitter/nvim-treesitter',
    branch = 'main',
    dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
    lazy = false,
    build = ':TSUpdate',
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "neovim-treesitter/nvim-treesitter" }
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "neovim-treesitter/nvim-treesitter" },
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
