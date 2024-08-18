return {
    "echasnovski/mini.indentscope",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "dashboard",
                "fzf",
                "lazy",
                "mason",
                "toggleterm",
                "lazyterm",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
    event = { "BufReadPost", "BufNewFile" },
    opts = { symbol = "│", options = { try_as_border = true } },
}
