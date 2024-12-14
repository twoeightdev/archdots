return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        indent = { char = "│", tab_char = "│" },
        scope = { enabled = false },
        exclude = { filetypes = { "lazy", "dashboard", "mason" } },
    },
}

-- Last Modified: Thu, 12 Dec 2024 02:45:20 PM
