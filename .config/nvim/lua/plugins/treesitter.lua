return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "org",
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
            "cpp",
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        matchup = {
            enable = true,
            include_match_words = true,
            enable_quotes = true,
        },
    },
    config = function(_, opts)
        -- PREF: Use git instead of curl
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.configs").setup(opts)
        vim.treesitter.language.register("bash", "zsh")
    end,
}
