return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
        disable_filetype = { 'TelescopePrompt', 'text' },
        disable_in_macro = false,
        check_ts = true,
    },
}
