-- Open file explorer in current file's dir
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window ops
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>ws", vim.cmd.split)
vim.keymap.set("n", "<leader>w<Left>", "<C-w><Left>")
vim.keymap.set("n", "<leader>w<Right>", "<C-w><Right>")
vim.keymap.set("n", "<leader>w<Up>", "<C-w><Up>")
vim.keymap.set("n", "<leader>w<Down>", "<C-w><Down>")

-- Tab ops
vim.keymap.set("n", "<leader>ts", ":tab split<CR>")
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tc", ":tabonly<CR>")
vim.keymap.set("n", "<leader>to", "<C-w>gf")
vim.keymap.set("n", "<leader>t1", ":tabnext 1<CR>")
vim.keymap.set("n", "<leader>t2", ":tabnext 2<CR>")
vim.keymap.set("n", "<leader>t3", ":tabnext 3<CR>")

-- Is Visual mode, move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move around code with cursor centered
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without rewriting current buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank in clipboard buffer
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete into the void
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Erase Q binding
vim.keymap.set("n", "Q", "<nop>")

-- Format file
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Full file replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
