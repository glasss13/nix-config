return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        local lsp_servers = {
            lua_ls = {},
            rust_analyzer = {},
            ts_ls = {},
            clangd = {},
            gopls = {},
            pylsp = {},
            rnix = {},
        }

        local ensure_installed = {}
        for server, _ in pairs(lsp_servers) do
            table.insert(ensure_installed, server)
        end

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
        })


        local lspconfig = require('lspconfig')

        lspconfig["lua_ls"].setup({
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        lspconfig["clangd"].setup({
            cmd = {
                "clangd",
                "--background-index",
                "-j=12",
                "--clang-tidy",
                "--clang-tidy-checks=*",
                "--suggest-missing-includes",
                "--all-scopes-completion",
                "--cross-file-rename",
                "--completion-style=detailed",
                "--header-insertion-decorators",
                "--header-insertion=iwyu",
                "--pch-storage=memory",
            },
            init_options = {
                clangdFileStatus = true,
                usePlaceholders = true,
                completeUnimported = true,
                semanticHighlighting = true,
            },
        })

        for server, config in pairs(lsp_servers) do
            -- passing config.capabilities to blink.cmp merges with the capabilities in your
            -- `opts[server].capabilities, if you've defined it
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end
}
