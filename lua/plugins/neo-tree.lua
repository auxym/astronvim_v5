return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sort_case_insensitive = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }
  },
}
