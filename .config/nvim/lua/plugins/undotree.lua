return {
    "mbbill/undotree",
    keys = {
        {
            "<leader>au",
            "<cmd>UndotreeToggle<cr>",
            desc = "Open undo tree",
        },
    },
    config = function()
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_ShortIndicators = 1
    end,
}
