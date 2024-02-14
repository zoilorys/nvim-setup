return {
  "prettier/vim-prettier",
  build = "yarn install --frozen-lockfile --production",
  config = function()
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*.vue", "*.vuex", "*.ts", "*.tsx", "*.js", "*.jsx", "*.html", "*.css", "*.scss", "*.json" },
      command = ":Prettier"
    })
  end

}
