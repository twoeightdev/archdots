return {
    {
        -- nvim-treesitter
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            ensure_installed = {
                'lua',
                'luadoc',
                'luap',
                'cpp',
                'markdown',
                'markdown_inline',
                'python',
                'git_config',
                'git_rebase',
                'gitcommit',
                'gitignore',
                'diff',
                'vim',
                'vimdoc',
                'bash',
                'toml',
                'ssh_config',
                'zathurarc',
                'json',
                'printf',
            },
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            -- vim-matchup config
            matchup = {
                enable = true,
                include_match_words = true,
                enable_quotes = true,
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
            -- Use the bash ts parser for zsh
            vim.treesitter.language.register('bash', 'zsh')
        end,
    },
    {
        -- nvim-treesitter-context
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = { max_lines = 3 },
    },
}
