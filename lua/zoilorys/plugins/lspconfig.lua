return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lua" },
    { "folke/neoconf.nvim" },
    { "L3MON4D3/LuaSnip" },
  },
  config = function()
    require("neoconf").setup {}
    require("mason").setup {}
    require("mason-lspconfig").setup {
      ensure_installed = { "tsserver", "volar", "gopls", "rust_analyzer", "templ" }
    }

    local lspconfig = require "lspconfig"

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        local server_config = {}

        if require("neoconf").get(server_name .. ".disable") then
          return
        end
        if server_name == "lua_ls" then
          server_config.settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              }
            }
          }
        end
        if server_name == "emmet_language-server" then
          server_config.filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss",
            "pug", "typescriptreact", "templ" }
        end
        if server_name == "volar" then
          server_config.filetypes = { "vue", "typescript", "javascript" }
        end
        if server_name == "angularls" then
          server_config.filetypes = { "typescript", "javascript", "html" }
        end

        lspconfig[server_name].setup(server_config)
      end
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, remap = false }

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set("n", "<leader>bdv", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>bws", function() vim.lsp.buf.workspace_symbol() end, opts)

        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
        --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        --     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        --     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        --     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        --     vim.keymap.set('n', '<space>wl', function()
        --       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --     end, opts)
        --     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        --     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        --     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        --     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        --     vim.keymap.set('n', '<space>f', function()
        --       vim.lsp.buf.format { async = true }
        --     end, opts)
      end
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      },
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
    })
  end
}
