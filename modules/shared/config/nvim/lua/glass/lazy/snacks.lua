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
        picker = {
            enabled = true,
            layout = {
                preset = "telescope",
            },
        },
    },

    keys = {
        { "<leader>gb", function() Snacks.git.blame_line() end,              desc = "Git Blame Line" },
        { "<leader>gB", function() Snacks.gitbrowse() end,                   desc = "Git Browse" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end,            desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end,                     desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end,                 desc = "Lazygit Log (cwd)" },
        { "<c-t>",      function() Snacks.terminal() end,                    desc = "Toggle Terminal" },


        { "<leader>pf", function() Snacks.picker.files() end,                desc = "Picker search files" },
        { "<C-p>",      function() Snacks.picker.git_files() end,            desc = "Picker search git files" },
        { "<leader>ps", function() Snacks.picker.grep() end,                 desc = "Picker grep" },
        { "<leader>o",  function() Snacks.picker.buffers() end,              desc = "Picker search open buffers" },
        { "gd",         function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
        { "gD",         function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
        { "gr",         function() Snacks.picker.lsp_references() end,       nowait = true,                        desc = "References" },
        { "gt",         function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,          desc = "LSP Symbols" },
    },

}
