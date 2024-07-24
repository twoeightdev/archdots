return {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
        vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
        end
        vim.ui.input = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.input(...)
        end
    end,
    opts = {
        input = {
            override = function(conf)
                conf.col = -1
                conf.row = 0
                return conf
            end,
        },
    },
}
