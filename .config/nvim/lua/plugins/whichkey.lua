return {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "y", "d", "z", "g", "[", "]", "<C-w>" },
    opts = {
        defaults = {
            mode = { "n", "v" },
            ["gz"] = { name = "+surround" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>f"] = { name = "+find" },
            ["<leader>b"] = { name = "+buffers" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
