return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        local lsp_servers = {
            "lua_ls",
            "rust_analyzer",
            "ts_ls",
            "clangd",
            "gopls",
            "pylsp",
            "rnix",
        }

        local server_conf = {}
        for _, name in ipairs(lsp_servers) do
            server_conf[name] = {}
        end

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = lsp_servers,
            automatic_installation = true,
        })

        server_conf["clangd"] = {
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
                "--function-arg-placeholders=false",
            },
            init_options = {
                clangdFileStatus = true,
                usePlaceholders = false,
                completeUnimported = true,
                semanticHighlighting = true,
            },
        }

        server_conf["lua_ls"] = {
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }


        local lspconfig = require('lspconfig')
        for server, config in pairs(server_conf) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
        end
    end
}
