return {
    "Julian/lean.nvim",
    event = { "BufReadPre *.lean", "BufNewFile *.lean" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
    },
    -- lean.nvim no longer has a setup() function; it reads vim.g.lean_config.
    -- Don't pass `opts` here, or lazy.nvim will try to call setup().
    init = function()
        vim.g.lean_config = {
            mappings = true,
        }
    end,
}
