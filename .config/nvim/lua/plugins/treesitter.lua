return {
    {
        -- nvim-treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "vim",
                "vimdoc",
                "bash",
                "toml",
                "zathurarc",
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "xml",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "diff",
                "printf",
                "ini",
                "query",
                "c",
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
            require("nvim-treesitter.configs").setup(opts)
            -- use bash ts parser for zsh
            vim.treesitter.language.register("bash", "zsh")
        end,
    },
    {
        -- nvim-treesitter-context
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        opts = { max_lines = 3 },
    },
}
