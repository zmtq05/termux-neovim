require("nvim-treesitter.configs").setup {
  -- A list of parser names, or "all"
  ensure_installed = { "vim", "lua" },
  highlight = { enable = true },
}
