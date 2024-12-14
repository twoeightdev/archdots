return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "ibhagwan/fzf-lua",
    },
    cmd = "Neogit",
    keys = {
        {
            "<leader>gg",
            function()
                return require("neogit").open()
            end,
            desc = "Open neogit",
        },
    },
    opts = {
        console_timeout = 10000,
        kind = "replace",
        status = { recent_commit_count = 25 },
        integrations = {
            fzf_lua = true,
            diffview = true,
        },
        auto_show_console = false,
    },
}

-- Last Modified: Fri, 13 Dec 2024 12:00:48 PM
