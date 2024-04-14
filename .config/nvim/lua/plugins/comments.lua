return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<c-'>",
            },
            opleader = {
                line = "<c-'>",
            },
        })
    end,
}
