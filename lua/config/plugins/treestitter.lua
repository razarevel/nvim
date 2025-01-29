return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "lua", "vim", "rust", "vimdoc", "query", "markdown", "markdown_inline" },
        auto_install = true,
        highlight = {
          enable = true,
          disable ={""},
          additional_vim_regex_highlighting = true,
        },
      }
    end,
  }
}
