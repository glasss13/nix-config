return {
    'saghen/blink.cmp',
    lazy = false,
    version = 'v0.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        signature = { enabled = true } -- experimental signature help support
    },
    opts_extend = { "sources.default" },
}
