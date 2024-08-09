return {
    "folke/which-key.nvim",
    -- lazy = true,
    event = "VeryLazy",
    opts = {
        spec = {
            {
                mode = { "n", "v" },
                { "<leader>a", group = "action" },
                { "<leader>g", group = "git" },
                { "<leader>f", group = "find" },
                { "<leader>l", group = "lsp" },
                { "<leader>d", group = "debugger" },
                { "<leader><tab>", group = "buffers" },
                { "<leader>o", group = "orgmode" },
                { "<leader>ob", group = "org buffer" },
                { "<leader>od", group = "org date" },
                { "<leader>oi", group = "org insert" },
                { "<leader>ol", group = "org links" },
                { "<leader>on", group = "org notes" },
                { "<leader>ox", group = "org clock" },
            },
        },
        win = {
            no_overlap = true,
            border = "single",
            title = false,
        },
        layout = {
            spacing = 1,
            align = "center",
        },
        icons = {
            rules = false,
            breadcrumb = "»",
            -- separator = "▶",
            separator = "🌑",
            group = "+",
            keys = {
                Tab = "⭳",
            },
        },
        show_help = false,
        show_keys = false,
    },
}
