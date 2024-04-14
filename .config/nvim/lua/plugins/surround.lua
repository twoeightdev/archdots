return {
    "echasnovski/mini.surround",
    keys = {
        { "gza", mode = { "n", "v" }, desc = "Add surrounding" },
        { "gzd", desc = "Delete surrounding" },
        { "gzf", desc = "Find right surrounding" },
        { "gzF", desc = "Find left surrounding" },
        { "gzh", desc = "Highlight surrounding" },
        { "gzr", desc = "Replace surrounding" },
        { "gzn", desc = "Updated n_lines" },
    },
    opts = {
        mappings = {
            add = "gza",
            delete = "gzd",
            find = "gzf",
            find_left = "gzF",
            highlight = "gzh",
            replace = "gzr",
            update_n_lines = "gzn",
        },
    },
}
