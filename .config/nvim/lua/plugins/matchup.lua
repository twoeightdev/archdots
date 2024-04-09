return {
    'andymass/vim-matchup',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
        vim.g.matchup_matchparen_offscreen = {}
        vim.g.matchup_matchparen_deferred = 1
    end,
}
