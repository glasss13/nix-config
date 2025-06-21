return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local actions = require("telescope.actions")
            local options = {
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "-L",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    file_sorter = require("telescope.sorters").get_fuzzy_file,
                    file_ignore_patterns = { "node_modules" },
                    -- path_display = { "truncate" },
                    -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                    mappings = {
                        n = { ["q"] = require("telescope.actions").close },
                    },
                },

                extensions_list = { "themes", "terms" },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                        },
                    },
                }
            }

            require("telescope").setup(options)
            local builtin = require('telescope.builtin')

            -- vim.keymap.set("n", "<leader>o", builtin.buffers, {})
            vim.keymap.set("n", "<leader>po", "<cmd>Telescope oldfiles<CR>", {})
            -- vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            -- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            -- vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
        end
    }
}
