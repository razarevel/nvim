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


vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.keymap.set("n", "<up>", "<nop>", { noremap = true })
vim.keymap.set("n", "<down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<right>", "<nop>", { noremap = true })

vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<left>", "<nop>", { noremap = true })
vim.keymap.set("i", "<right>", "<nop>", { noremap = true })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")


vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})


local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)

  job_id = vim.bo.channel
end)


vim.keymap.set("n", "<space>example", function()
  vim.fn.chansend(job_id, { "ls -al\rn" })
end)
