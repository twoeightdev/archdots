return {
    "Wansmer/treesj",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = { max_join_length = 150 },
    keys = {
        {
            "<leader>m",
            function()
                return require("treesj").toggle()
            end,
            desc = "Toggle node under cursor",
        },
        {
            "<leader>j",
            function()
                return require("treesj").join()
            end,
            desc = "Join node under cursor",
        },
        {
            "<leader>s",
            function()
                return require("treesj").split()
            end,
            desc = "Split node under cursor",
        },
    },
}
