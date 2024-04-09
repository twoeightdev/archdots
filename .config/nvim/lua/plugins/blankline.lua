return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
        indent = { char = '│', tab_char = '│' },
        scope = { enabled = false },
        exclude = { filetypes = { 'lazy', 'dashboard', 'mason' } },
    },
}
