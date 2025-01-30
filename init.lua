vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
require("config.lazy")
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":.lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Hightlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('Kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.keymap.set("i", "<up>", "<nop>")
vim.keymap.set("i", "<left>", "<nop>")
vim.keymap.set("i", "<down>", "<nop>")
vim.keymap.set("i", "<right>", "<nop>")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 15

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})



vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n><C-w>h")
vim.keymap.set("n", "<space>fs", "<cmd>Ex<CR>")

-- undo
vim.keymap.set("n", "u", "<nop>", { noremap = true })
vim.keymap.set("n", "<C-u>", "<cmd>undo<CR>")

-- hl search
vim.keymap.set("n", "<esc><esc>", "<cmd>nohl<CR>");
