return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  priority = 1000,
  config = function()
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "go", "rust", "html", "css", "scss" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
