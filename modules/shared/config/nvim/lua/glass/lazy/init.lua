return {
    {
        "olimorris/onedarkpro.nvim",
        config = function()
            vim.cmd("colorscheme onedark")
        end
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    "nvim-lua/plenary.nvim",
    "tpope/vim-sleuth",
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup()
        end
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup()
        end
    },
}
