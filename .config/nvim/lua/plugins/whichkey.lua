return {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "y", "d", "z", "g", "[", "]", "<C-w>" },
    opts = {
        icons = {
            separator = "»",
            group = "+",
        },
        window = {
            border = "single",
        },
        show_help = false,
        show_keys = false,
        defaults = {
            mode = { "n", "v" },
            ["gz"] = { name = "surround" },
            ["<leader>a"] = { name = "actions" },
            ["<leader>g"] = { name = "git" },
            ["<leader>f"] = { name = "find" },
            ["<leader>b"] = { name = "buffers" },
            ["<leader>d"] = { name = "diagnostics/quickfix" },
            ["<leader>t"] = { name = "todo" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
