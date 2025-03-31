return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      window = {
        width = 30,
      },
      filesystem = {
        filtered_items = {
          always_show = { ".gitignore" },
          never_show = { "__pycache__" },
        },
      },
    },
  },
}
