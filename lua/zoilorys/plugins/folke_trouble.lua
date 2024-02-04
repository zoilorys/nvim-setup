return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function ()
    vim.keymap.set("n", "<leader>rt", "<CMD>TroubleToggle<CR>")
    vim.keymap.set("n", "<leader>rw", "<CMD>TroubleToggle workspace_diagnostics<CR>")
    vim.keymap.set("n", "<leader>rd", "<CMD>TroubleToggle document_diagnostics<CR>")
    vim.keymap.set("n", "<leader>rq", "<CMD>TroubleToggle quickfix<CR>")
    vim.keymap.set("n", "<leader>rl", "<CMD>TroubleToggle loclist<CR>")
    vim.keymap.set("n", "<leader>rr", "<CMD>TroubleToggle lsp_references<CR>")
  end
}
