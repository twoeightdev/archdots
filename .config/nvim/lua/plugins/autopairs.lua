return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        disable_filetype = { "text" },
        -- enable treesitter
        check_ts = true,
    },
}
