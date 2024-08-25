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
            org_default_notes_file = "~/.local/src/orgnotes/inbox.org",
            org_archive_location = "~/.local/src/orgnotes/agenda/purge.org",
            org_todo_keywords = {
                "TODO(t)",
                "DONE(d)",
                "ONGOING(o)",
                "CANCELLED(c)",
            },
            org_ellipsis = "󱞣",
            org_hide_emphasis_markers = false,
            org_startup_indented = true,
            org_startup_folded = "content",
            win_split_mode = "horizontal",
            org_agenda_span = "week",
            org_agenda_min_height = 16,
            notifications = {
                enabled = true,
                deadline_warning_reminder_time = true,
                reminder_time = 10,
                deadline_reminder = true,
                scheduled_reminder = true,
            },
            mappings = {
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
