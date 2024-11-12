return {
    {
        "nvim-orgmode/orgmode",
        event = "VeryLazy",
        ft = { "org" },
        opts = {
            ui = {
                folds = {
                    colored = true,
                },
            },
            org_agenda_files = "~/.local/src/orgnotes/agenda/**/*",
            org_default_notes_file = "~/.local/src/orgnotes/agenda/refile.org",
            org_archive_location = "~/.local/src/orgnotes/agenda/purge.org",
            org_todo_keywords = {
                "TODO(t)",
                "WORK(w)",
                "|",
                "DONE(d)",
                "KILL(k)",
            },
            org_todo_keyword_faces = {
                TODO = ":background #f38ba8 :foreground #1e1e2e :weight bold",
                WORK = ":background #f9e2af :foreground #1e1e2e :weight bold :underline on",
                DONE = ":background #a6e3a1 :foreground #1e1e2e :weight bold",
                KILL = ":background #fab387 :foreground #1e1e2e :weight bold",
            },
            org_ellipsis = "󱞣",
            org_hide_emphasis_markers = true,
            org_hide_leading_stars = true,
            org_startup_indented = true,
            org_startup_folded = "content",
            win_split_mode = "horizontal",
            org_blank_before_new_entry = {
                heading = false,
                plain_list_item = false,
            },
            org_agenda_span = "week",
            org_agenda_min_height = 16,
            org_agenda_skip_scheduled_if_done = true,
            org_agenda_skip_deadline_if_done = true,
            notifications = {
                enabled = true,
                deadline_warning_reminder_time = true,
                reminder_time = 10,
                deadline_reminder = true,
                scheduled_reminder = true,
            },
            mappings = {
                org = {
                    org_toggle_checkbox = "<Space><Space>",
                    org_toggle_heading = "gT",
                    org_insert_link = "gL",
                    org_schedule = "gS",
                    org_deadline = "gD",
                    org_timestamp_up = "+",
                    org_timestamp_down = "-",
                },
                global = {
                    org_agenda = "gA",
                    -- org_agenda = { "gA", "<Leader>oa" },
                    -- org_toggle_checkbox = { "<Leader>Space", "<C-Space>" },
                },
                org_return_uses_meta_return = true,
            },
        },
    },
    {
        "chipsenkbeil/org-roam.nvim",
        tag = "0.1.0",
        event = "VeryLazy",
        ft = { "org" },
        dependencies = {
            { "nvim-orgmode/orgmode", tag = "0.3.4" },
        },
        opts = {
            directory = "~/.local/src/orgnotes",
            org_files = {
                "~/.local/src/orgnotes/linux",
            },
            immediate = {
                target = "%[slug].org",
            },
            extensions = {
                dailies = {
                    directory = "journal",
                },
            },
        },
    },
    {
        "akinsho/org-bullets.nvim",
        event = "VeryLazy",
        ft = { "org" },
        opts = {
            concealcursor = true,
            symbols = {
                list = "•",
                headlines = { "󰪥", "󰻃", "🞆", "✸", "✿" },
                checkboxes = {
                    half = { "", "OrgTSCheckboxHalfChecked" },
                    done = { "󰄬", "@org.keyword.done" },
                    todo = { "x", "@org.keyword.todo" },
                },
            },
        },
    },
}
