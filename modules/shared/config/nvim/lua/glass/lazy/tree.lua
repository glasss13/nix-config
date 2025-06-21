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
      -- *nvim-tree.update_focused_file.enable*

      -- empty setup using defaults
      require("nvim-tree").setup({
        update_focused_file = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        view = {
          side = "right"
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


-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--     "MunifTanjim/nui.nvim",
--     -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
--   },
--   lazy = false, -- neo-tree will lazily load itself
--   ---@module "neo-tree"
--   ---@type neotree.Config?
--   opts = {
--     -- fill any relevant options here
--   },
-- }
