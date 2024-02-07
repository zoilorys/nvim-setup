return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
    }
  },
  config = function()
    local builtin = require "telescope.builtin"

    vim.keymap.set('n', '<leader>pf', function()
      require("zoilorys.telescope-config").project_files()
    end)
    vim.keymap.set('n', '<leader>pg', function()
      builtin.git_files { path_display = { truncate = 3 } }
    end)
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > "), path_display = { truncate = 3 } })
    end, {})
  end,
}
