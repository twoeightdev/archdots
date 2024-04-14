return {
    "nvimdev/dashboard-nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VimEnter",
    opts = {
        theme = "hyper",
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                {
                    desc = " New",
                    group = "Files",
                    action = "ene | startinsert",
                    key = "e",
                },
                {
                    desc = " Update",
                    group = "@property",
                    action = "Lazy update",
                    key = "u",
                },
                {
                    icon = "󰈞 ",
                    icon_hl = "@variable",
                    desc = "Files",
                    group = "Label",
                    action = "Telescope find_files",
                    key = "f",
                },
                {
                    desc = " Neogit",
                    group = "Git",
                    action = "Neogit",
                    key = "g",
                },
                {
                    desc = " Quit Neovim",
                    action = "qa",
                    key = "q",
                },
            },
            footer = { "", "Major bugs 🐛 incoming !!!" },
        },
    },
}
