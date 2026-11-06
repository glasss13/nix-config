return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup({})
            treesitter.install({
                "bash", "c", "comment", "css", "go", "graphql", "html",
                "http", "javascript", "json", "lua", "markdown", "markdown_inline",
                "python", "rust", "typescript",
            })

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("glass_treesitter", { clear = true }),
                callback = function(event)
                    -- Keep filetypes without an installed parser usable.
                    pcall(vim.treesitter.start, event.buf)
                end,
            })
        end,
    },
}
