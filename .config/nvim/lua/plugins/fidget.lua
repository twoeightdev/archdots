return {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
        notification = { window = { winblend = 0 } },
        logger = { level = vim.log.levels.OFF },
        progress = { suppress_on_insert = true, display = { render_limit = 3 } },
    },
}
