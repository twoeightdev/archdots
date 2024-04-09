return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    cmd = 'Neogit',
    keys = {
        {
            '<leader>gg',
            function()
                return require('neogit').open()
            end,
            desc = 'Open neogit',
        },
    },
    opts = {
        disable_insert_on_commit = 'auto',
        kind = 'replace',
        status = { recent_commit_count = 25 },
        integrations = { telescope = true },
        auto_show_console = false,
        telescope_sorter = function()
            return require('telescope').extensions.fzf.native_fzf_sorter()
        end,
    },
}
