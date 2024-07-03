return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    version = "*",
    event = "UIEnter",
    keys = {
        {
            "<Tab>",
            "<cmd>BufferLineCycleNext<cr>",
            desc = "Go to next buffer",
        },
        {
            "<S-Tab>",
            "<cmd>BufferLineCyclePrev<cr>",
            desc = "Go to previous buffer",
        },
        {
            "<S-l>",
            "<cmd>BufferLineMoveNext<cr>",
            desc = "Move current buffer forwards",
        },
        {
            "<S-h>",
            "<cmd>BufferLineMovePrev<cr>",
            desc = "Move current buffer backwards",
        },
        {
            "<leader>bn",
            "<cmd>BufferLineMoveNext<cr>",
            desc = "Move current buffer forwards",
        },
        {
            "<leader>bp",
            "<cmd>BufferLineMovePrev<cr>",
            desc = "Move current buffer backwards",
        },
        {
            "<leader>bf",
            function()
                return require("bufferline").move_to(1)
            end,
            desc = "Move buffer to beginning",
        },
        {
            "<leader>bl",
            function()
                return require("bufferline").move_to(-1)
            end,
            desc = "Move buffer to end",
        },
        {
            "<leader>b1",
            function()
                return require("bufferline").go_to(1, true)
            end,
            desc = "Jump to first buffer",
        },
        {
            "<leader>b2",
            function()
                return require("bufferline").go_to(2, true)
            end,
            desc = "Jump to second buffer",
        },
        {
            "<leader>b3",
            function()
                return require("bufferline").go_to(3, true)
            end,
            desc = "Jump to third buffer",
        },
        {
            "<leader>b4",
            function()
                return require("bufferline").go_to(4, true)
            end,
            desc = "Jump to fourth buffer",
        },
        {
            "<leader>b5",
            function()
                return require("bufferline").go_to(5, true)
            end,
            desc = "Jump to fifth buffer",
        },
        {
            "<leader>b6",
            function()
                return require("bufferline").go_to(6, true)
            end,
            desc = "Jump to sixth buffer",
        },
        {
            "<leader>b7",
            function()
                return require("bufferline").go_to(7, true)
            end,
            desc = "Jump to seventh buffer",
        },
        {
            "<leader>b8",
            function()
                return require("bufferline").go_to(8, true)
            end,
            desc = "Jump to eighth buffer",
        },
        {
            "<leader>b9",
            function()
                return require("bufferline").go_to(8, true)
            end,
            desc = "Jump to ninth buffer",
        },
        {
            "<leader>b$",
            function()
                return require("bufferline").go_to(-1, true)
            end,
            desc = "Jump to last buffer",
        },
    },
    opts = {
        options = {
            numbers = function(opts)
                return string.format("%s", opts.ordinal)
            end,
            mode = "buffers",
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diag)
                local ret = (diag.error and " " .. diag.error .. " " or "")
                    .. (diag.warning and " " .. diag.warning or "")
                return vim.trim(ret)
            end,
            themable = true,
        },
        highlights = {
            -- bufferline background
            fill = {
                bg = "#191724",
                ctermbg = "#191724",
            },
            -- selected tab background
            background = {
                bg = "#191724",
                ctermbg = "#191724",
            },
            -- Close button background
            close_button = {
                bg = "#191724",
                ctermbg = "#191724",
            },
            -- Numberline background
            numbers = {
                bg = "#191724",
                ctermbg = "#191724",
            },
            -- Separator background
            separator = {
                bg = "#191724",
                ctermbg = "#191724",
            },
        },
    },
}
