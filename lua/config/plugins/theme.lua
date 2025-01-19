-- lua/plugins/rose-pine.lua
return {
  "shaunsingh/moonlight.nvim",
  name = "moonlight-nvim",
  config = function()
    vim.cmd("colorscheme moonlight")
  end
}
