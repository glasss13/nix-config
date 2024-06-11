return {
    "nvim-tree/nvim-web-devicons",
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- optionally enable 24-bit colour
            vim.opt.termguicolors = true

            -- empty setup using defaults
            require("nvim-tree").setup({
                diagnostics = {
                    enable = true,
                    icons = {
                        hint = "",
                        info = "",
                        warning = "",
                        error = "",
                    },
                },
                renderer = {
                    highlight_git = true,
                    icons = {
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = true,
                            git = true,
                        },
                        glyphs = {
                            symlink = "",
                            git = {
                                unstaged = "U",
                                staged = "S",
                                unmerged = "UM",
                                renamed = "R",
                                deleted = "D",
                                untracked = "",
                                ignored = "I",
                            },
                        }
                    }
                }
            })
            local api = require("nvim-tree.api")

            vim.keymap.set("n", "<leader>pv", api.tree.toggle)
        end
    }
}
