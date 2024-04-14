return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        disable_filetype = { "TelescopePrompt", "text" },
        -- enable treesitter
        check_ts = true,
    },
}
