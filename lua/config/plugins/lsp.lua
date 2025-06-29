return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {

          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },

    },
    config = function()
      require("lspconfig").lua_ls.setup {}
      require("lspconfig").ts_ls.setup {}
      require("lspconfig").gopls.setup {}
      -- require("lspconfig").clangd.setup {}

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require 'lspconfig'.html.setup {
        capabilities = capabilities,
      }



      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args) -- formatter
          -- for renaming
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
          end

          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return print("Just go back to vscode") end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
