return function()
  vim.keymap.set("n", "s", "<nop>")
  vim.keymap.set("n", "<C-I>", "<Tab>", { noremap = true })
  return {
    { "<bs><bs>", desc = "Clear search highlights" },
    { "<tab>", "%", desc = "go to matching part", mode = { "n" } },
    { "<leader>b", group = "buffer", icon = { "󰪷" } },
    { "<leader>bn", "<CMD>bn<CR>", desc = "Go to next buffer" },
    { "<leader>bp", "<CMD>bp<CR>", desc = "Go to previous buffer" },
    { "<leader>bl", "<CMD>b#<CR>", desc = "Go to last buffer" },
    { "<leader>c", group = "code", icon = { "󰘦" } },
    { "<leader>cd", "<CMD>lua vim.lsp.buf.definition()<CR>", icon = { "󰘦" }, desc = "Go to symbol definition" },
    { "<leader>cr", "<CMD>lua vim.lsp.buf.references()<CR>", icon = { "󰘦" }, desc = "Go to references" },
    { "<leader>cf", "<CMD>lua vim.lsp.buf.format()<CR>", desc = "format buffer using LSP" },
    { "<leader>d", group = "debug", icon = { "" } },
    { "<leader>f", group = "file", icon = { "󱧶" } },
    { "<leader>g", group = "git", icon = { "󰊢" } },
    { "<leader>p", group = "projects" },
    { "<leader>s", group = "search", icon = { "󰥨" } },
    { "<leader>w", group = "window", proxy = "<C-W>", icon = { "" } },
    { "<leader>x", group = "diagnostics", icon = { "" } },
    { "[", group = "previous", icon = { "" } },
    { "[e", "<CMD>lua vim.diagnostic.goto_prev()<CR>", desc = "Go to previous diagnostic" },
    { "]", group = "next", icon = { "" } },
    { "]e", "<CMD>lua vim.diagnostic.goto_next()<CR>", desc = "Go to next diagnostic" },
    { "g", group = "goto", icon = { "" } },
    { "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", icon = { "󰘦" }, desc = "Go to symbol definition" },
    { "gr", "<CMD>lua vim.lsp.buf.references()<CR>", icon = { "󰘦" }, desc = "Go to symbol references" },
    { "X", "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostic in a floating window", icon = { "" } },
    { "z", group = "fold", icon = { "" } },
    { "<S-Esc>", "<CMD>NoiceDismiss<CR>", desc = "dismiss noice notifications" }
  }
end
