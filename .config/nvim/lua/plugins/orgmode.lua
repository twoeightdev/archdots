return {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
        org_agenda_files = "~/.local/src/orgnotes/agenda/**/*",
        org_default_notes_file = "~/.local/src/orgnotes/agenda/refile.org",
        mappings = {
            org_return_uses_meta_return = true,
        },
    },
}
