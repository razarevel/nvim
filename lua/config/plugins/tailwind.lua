return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwindcss = true
        }
      })
    end
  }
}
