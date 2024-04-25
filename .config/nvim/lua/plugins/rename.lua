return {
    "smjonas/inc-rename.nvim",
    keys = {
        {
            "<leader>ar",
            function()
                return ":IncRename " .. vim.fn.expand("<cword>")
            end,
            expr = true,
            desc = "Rename",
        },
    },
    opts = { input_buffer_type = "dressing" },
}
