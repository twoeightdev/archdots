return {
    "smjonas/inc-rename.nvim",
    cmd = { "IncRename" },
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
