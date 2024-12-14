return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        ensure_installed = {
            "bash",
            "commonlisp",
            "cpp",
            "css",
            "diff",
            "gitcommit",
            "gitignore",
            "git_config",
            "git_rebase",
            "html",
            "ini",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "printf",
            "python",
            "query",
            "ssh_config",
            "tmux",
            "toml",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
            "zathurarc",
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
        matchup = {
            enable = true,
            include_match_words = true,
            enable_quotes = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        vim.treesitter.language.register("bash", "zsh")
    end,
}

-- Last Modified: Sat, 14 Dec 2024 11:41:40 PM
