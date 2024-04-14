return {
    "echasnovski/mini.indentscope",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "dashboard",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "toggleterm",
                "lazyterm",
            },
            callback = function()
                ---@diagnostic disable-next-line: inject-field
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
    event = { "BufReadPost", "BufNewFile" },
    opts = { symbol = "│", options = { try_as_border = true } },
}
