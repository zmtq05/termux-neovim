require("impatient")
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
require("global")
require("keymap")
require("option")
require("plugin.packer")

vim.api.nvim_cmd({
  cmd = "colorscheme",
  args = { "dracula" },
}, {})
nvim.augroup("user") {
  {
    "FileType",
    pattern = "lspinfo,qf,help",
    callback = function()
      vim.keymap.set("n", "q", "<C-w>q", { buffer = true })
    end,
  },
  { "TextYankPost", callback = vim.highlight.on_yank },
}
