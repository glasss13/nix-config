return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        indent = { enabled = true, animate = { enabled = false } },
        input = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        terminal = {
            win = {
                position = "float",
                width = 0.8,
                height = 0.6,
            },
        },
        lazygit = {
            win = {
                style = "lazygit",
                width = 0.9,
                height = 0.9,
            },
        },
    },

    keys = {
        { "<leader>gb", function() Snacks.git.blame_line() end,   desc = "Git Blame Line" },
        { "<leader>gB", function() Snacks.gitbrowse() end,        desc = "Git Browse" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end,          desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Lazygit Log (cwd)" },
        { "<c-t>",      function() Snacks.terminal() end,         desc = "Toggle Terminal" },
    },

}
