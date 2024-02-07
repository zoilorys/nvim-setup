return {
  "prettier/vim-prettier",
  branch = "release/0.x",
  build = "yarn install --frozen-lockfile --production",
  config = function ()
    vim.api.nvim_create_autocmd({"BufWritePre"}, {
      pattern = {"*.ts", "*.tsx", "*.js", "*.jsx", "*.html", "*.css", "*.scss", "*.json"},
      command = ":Prettier"
    })
  end

}
