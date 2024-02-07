# My Nvim Setup

This is my personal Nvim setup. Very basic, opinionated, nothing special. Roughly based of ThePrimeagen nvim setup.

### Plugins

#### Package Manager:

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - main package manager.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - LSP and formatters.

#### File Navigation:
 
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - the one and only.
- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) - great when working on the feature across few files.

#### LSP Setup:

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - godfather of LSP.
- [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) - super easy setup of LSPs.
- [prettier/vim-prettier](https://github.com/prettier/vim-prettier) - official prettier plugin

#### Misc Editor:

- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - show indent guides.
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs) - auto pair parenthesis, brackets, etc
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - show pretty status bar.

#### Git:

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - git highlighting, diffs, blame, hunks and actions.
- [https://github.com/tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - git diffs and status window.

#### Change History:

- [mbbill/undotree](https://github.com/mbbill/undotree) - better change history.

#### Diagnostics:

- [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - project diagnostics, references, etc.

#### Theme:

- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - average nvim enjoyer theme :) I use `tokyonight-storm`.


This list doesn't include dependencies and requirements.

### Keybindings

I am too lazy to list them all in a pretty fashion, so here is a compiled snippet of keymap sets from all over the place.
I set keybindings in their respective module `config` functions. Still not sure if this was a good idea.

```lua
-- Open file explorer in current file's dir
-- ‘p’ stands for project, (!! conflict with paste)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
— telescope
vim.keymap.set('n', '<leader>pf', function()
    require("zoilorys.telescope-config").project_files()
end)
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > "), path_display = { truncate = 3 } })
end, {})


-- Window ops, ‘w’ stands for window
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>ws", vim.cmd.split)
vim.keymap.set("n", "<leader>w<Left>", "<C-w><Left>")
vim.keymap.set("n", "<leader>w<Right>", "<C-w><Right>")
vim.keymap.set("n", "<leader>w<Up>", "<C-w><Up>")
vim.keymap.set("n", "<leader>w<Down>", "<C-w><Down>")

-- Tab ops, ’t’ stands for tab
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

-- Move around code with cursor in the center of the screen if possible
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without rewriting current buffer, ‘p’ stands for paste(!! intersects with project)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank in clipboard buffer, ‘y’ stands for yank
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete into the void, ‘d’ stands for delete
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Erase Q binding
vim.keymap.set("n", "Q", "<nop>")

-- Format file, ‘f’ stands for format
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Full file replace, ’s’ stands for search and replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- LSP bindings - ‘b’ stands for buffer, as in current file
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

vim.keymap.set("n", "<leader>bdv", function() vim.diagnostic.open_float() end, opts)
vim.keymap.set("n", "<leader>bws", function() vim.lsp.buf.workspace_symbol() end, opts)

vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
-- control + h - ‘h’ stands for help
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

-- LSP CMP bindings (CMP = completions, work only when completion is suggested)
['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
['<C-y>'] = cmp.mapping.confirm({ select = true }),
['<Enter>'] = cmp.mapping.confirm({ select = true }),
['<C-Space>'] = cmp.mapping.complete(),

-- Undotree , ‘u’ stands for undo
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Harpoon, ‘h’ stands for harpoon
vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end)

-- Gitsigns , control + g , ‘g’ stands for git
map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
map('n', '<C-g>s', gs.stage_hunk)
map('n', '<C-g>r', gs.reset_hunk)
map('v', '<C-g>s', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('v', '<C-g>r', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('n', '<C-g>S', gs.stage_buffer)
map('n', '<C-g>u', gs.undo_stage_hunk)
map('n', '<C-g>R', gs.reset_buffer)
map('n', '<C-g>p', gs.preview_hunk)
map('n', '<C-g>b', function() gs.blame_line { full = true } end)
map('n', '<C-g>tb', gs.toggle_current_line_blame)
map('n', '<C-g>d', gs.diffthis)
map('n', '<C-g>D', function() gs.diffthis('~') end)
map('n', '<C-g>td', gs.toggle_deleted)

        -- Text object
map({ 'o', 'x' }, '<C-g>hs', ':<C-U>Gitsigns select_hunk<CR>')

-- vim-fugitive, ‘g’ stands for git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Trouble, ‘r’ stands for tRouble (t is taken by tabs)
vim.keymap.set("n", "<leader>rt", "<CMD>TroubleToggle<CR>")
vim.keymap.set("n", "<leader>rw", "<CMD>TroubleToggle workspace_diagnostics<CR>")
vim.keymap.set("n", "<leader>rd", "<CMD>TroubleToggle document_diagnostics<CR>")
vim.keymap.set("n", "<leader>rq", "<CMD>TroubleToggle quickfix<CR>")
vim.keymap.set("n", "<leader>rl", "<CMD>TroubleToggle loclist<CR>")
vim.keymap.set("n", "<leader>rr", "<CMD>TroubleToggle lsp_references<CR>")
```
