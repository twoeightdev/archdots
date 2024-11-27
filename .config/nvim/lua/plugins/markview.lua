return {
    "OXY2DEV/markview.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>mt",
            "<cmd>Markview toggleAll<cr>",
            desc = "Markview toggle",
        },
        {
            "<leader>ms",
            "<cmd>Markview splitToggle<cr>",
            desc = "Split live preview",
        },
    },
    opts = {
        -- modes = { "n", "no", "i", "c" },
        -- modes = { "n", "v", "c", "nc" },
        -- hybrid_modes = { "n" },
        -- callbacks = {
        --     on_enable = function(_, win)
        --         vim.wo[win].conceallevel = 2
        --         vim.wo[win].concealcursor = "vc"
        --     end,
        -- },
        code_blocks = {
            enable = true,
            style = "block",
            language_direction = "left",
            sign = "",
        },
        --NOTE: style options: icon or label
        headings = {
            heading_1 = {
                sign = "",
                style = "label",
                -- icon = "Ⓐ  ",
            },
            heading_2 = {
                sign = "",
                style = "label",
                -- icon = "Ⓑ  ",
            },
            heading_3 = {
                sign = "",
                style = "label",
                -- icon = "Ⓒ  ",
            },
            heading_4 = {
                sign = "",
                style = "label",
                -- icon = "Ⓓ  ",
            },
            heading_5 = {
                sign = "",
                style = "label",
                -- icon = "Ⓔ  ",
            },
            heading_6 = {
                sign = "",
                style = "label",
                -- icon = "Ⓕ  ",
            },
        },
        tables = {
            block_decorator = true,
            use_virt_lines = true,
        },
    },
}
