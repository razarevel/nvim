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
      vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          -- formatter
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
            -- lsp maps
            local map = function(keys, func, desc, mode)
              mode = mode or 'n'
              vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
            end
            map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
            map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
            map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          end
        end,
      })
    end,
  }
}
