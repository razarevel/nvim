-- lua/plugins/rose-pine.lua
return {
  "shaunsingh/moonlight.nvim",
  name = "moonlight-nvim",
  config = function()
    vim.cmd("colorscheme moonlight")
    vim.g.moonlight_italic_comments = true
    vim.g.moonlight_italic_keywords = true
    vim.g.moonlight_italic_functions = true
    vim.g.moonlight_italic_variables = false
    vim.g.moonlight_contrast = true
    vim.g.moonlight_borders = false
    vim.g.moonlight_disable_background = true

    -- Load the colorscheme
    require('moonlight').set()
  end
}
