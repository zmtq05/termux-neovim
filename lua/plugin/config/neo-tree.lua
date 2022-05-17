vim.g.neo_tree_remove_legacy_commands = 1
require("neo-tree").setup {
  filesystem = {
    window = {
      mappings = {
        o = "open",
      },
    },
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function(file_path)
        require("neo-tree").close_all()
      end,
    },
  },
}
vim.keymap.set("n", "<leader>e", ":Neotree<CR>")
