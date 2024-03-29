return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
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
      end
    }
  end
}
