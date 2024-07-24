return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        {
            "<leader>fw",
            function()
                return require("fzf-lua").live_grep()
            end,
            desc = "Project live grep",
        },
        {
            "<leader>ff",
            function()
                return require("fzf-lua").files()
            end,
            desc = "Files",
        },
        {
            "<leader>fo",
            function()
                return require("fzf-lua").oldfiles()
            end,
            desc = "Recent files",
        },
        {
            "<leader>fx",
            function()
                return require("fzf-lua").files({ cwd = "~/" })
            end,
            desc = "Home search",
        },
        {
            "<leader>fX",
            function()
                return require("fzf-lua").files({ cwd = "~/.local/" })
            end,
            desc = "Local search",
        },
        {
            "<leader>fk",
            function()
                return require("fzf-lua").keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>fh",
            function()
                return require("fzf-lua").helptags()
            end,
            desc = "Help",
        },
        {
            "<leader>fc",
            function()
                return require("fzf-lua").command_history()
            end,
            desc = "Command history",
        },
        {
            "<leader>fC",
            function()
                return require("fzf-lua").commands()
            end,
            desc = "Commands",
        },
        {
            "<leader>fr",
            function()
                return require("fzf-lua").registers()
            end,
            desc = "Registers",
        },
        {
            "<leader>fm",
            function()
                return require("fzf-lua").manpages()
            end,
            desc = "Man pages",
        },
        -- {
        --     "<leader>ft",
        --     function()
        --         return require("fzf-lua").grep({
        --             search = "TODO|HACK|PERF|NOTE|FIX|FIXME",
        --             no_esc = true,
        --         })
        --     end,
        --     desc = "TODO comments",
        -- },
        {
            "<leader>ds",
            function()
                return require("fzf-lua").lsp_document_symbols()
            end,
            desc = "Symbol lsp document",
        },
        {
            "<leader>da",
            function()
                return require("fzf-lua").lsp_code_actions()
            end,
            desc = "Actions",
        },
        {
            "<leader>dd",
            function()
                return require("fzf-lua").diagnostics_document()
            end,
            desc = "Document diagnostics",
        },
        {
            "<leader>dw",
            function()
                return require("fzf-lua").diagnostics_workspace()
            end,
            desc = "Workspace diagnostics",
        },
        {
            "<leader>gf",
            function()
                return require("fzf-lua").git_files()
            end,
            desc = "Files",
        },
        {
            "<leader>gi",
            function()
                return require("fzf-lua").git_status()
            end,
            desc = "Info/status",
        },
        {
            "<leader>gb",
            function()
                return require("fzf-lua").git_branches()
            end,
            desc = "Branches",
        },
        {
            "<leader>gc",
            function()
                return require("fzf-lua").git_commits()
            end,
            desc = "Check git commits",
        },
        {
            "<leader><tab><tab>",
            function()
                return require("fzf-lua").buffers()
            end,
            desc = "Buffers",
        },
    },
    opts = {
        winopts = {
            border = "single",
            row = 0.50,
            col = 0.50,
            preview = {
                scrollbar = false,
                title_pos = "left",
            },
        },
        grep = {
            prompt = "   Grep Word ",
            no_header = true,
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        files = {
            formatter = "path.filename_first",
            prompt = "   Files ",
            cwd_prompt = false,
            no_header = true,
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        oldfiles = {
            formatter = "path.filename_first",
            prompt = "   Recent Files ",
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        keymaps = {
            prompt = "   Keymaps ",
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:10%",
                },
            },
        },
        helptags = {
            prompt = "  Help ",
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        command_history = {
            prompt = "   Command History ",
            fzf_opts = {
                ["--separator"] = " ",
                ["--header"] = " ",
            },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        commands = {
            prompt = "   Commands ",
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        registers = {
            prompt = "   Registers ",
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        manpages = {
            prompt = "  Man Pages ",
            fzf_opts = { ["--separator"] = " " },
            preview_opts = "hidden",
        },
        lsp = {
            code_actions = {
                prompt = "   Code Actions ",
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:70%",
                    },
                },
            },
            symbols = {
                prompt = "   Lsp document symbols ",
                fzf_opts = { ["--separator"] = " " },
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:70%",
                    },
                },
            },
        },
        diagnostics = {
            prompt = "   Diagnostics ",
            fzf_opts = { ["--separator"] = " " },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
        git = {
            files = {
                prompt = "   Git Files",
                fzf_opts = { ["--separator"] = " " },
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:70%",
                    },
                },
            },
            branches = {
                prompt = "   Git Branch",
                no_header = true,
                fzf_opts = { ["--separator"] = " " },
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:70%",
                    },
                },
            },
            commits = {
                prompt = "   Git Commits",
                no_header = true,
                fzf_opts = { ["--separator"] = " " },
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:70%",
                    },
                },
            },
            status = {
                prompt = "   Git Status",
                no_header = true,
                fzf_opts = { ["--separator"] = " " },
                winopts = {
                    preview = {
                        layout = "vertical",
                        vertical = "down:70%",
                    },
                },
            },
        },
        buffers = {
            formatter = "path.filename_first",
            prompt = "   Buffers ",
            no_header = true,
            fzf_opts = {
                ["--separator"] = " ",
                ["--with-nth"] = "-1..",
            },
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down:70%",
                },
            },
        },
    },
}
