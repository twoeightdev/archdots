return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        options = {
            theme = "auto",
            component_separators = "|",
            section_separators = { left = "", right = "" },
            -- component_separators = { left = "", right = "" },
            -- section_separators = { left = "", right = "" },
            disabled_filetypes = {
                "dashboard",
                "NeogitStatus",
                "NeogitCommitView",
                "NeogitPopup",
                "NeogitConsole",
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                "branch",
                "diff",
                { "diagnostics", sources = { "nvim_lsp", "nvim_diagnostic" } },
            },
            lualine_c = {
                "filename",
                {
                    function()
                        return require("nvim-navic").get_location()
                    end,
                    cond = function()
                        return package.loaded["nvim-navic"]
                            and require("nvim-navic").is_available()
                    end,
                    color_correction = "static",
                    -- NOTE: padding right set to '0' to avoid navic color glitch
                    padding = { left = 1, right = 0 },
                },
            },
            lualine_x = {
                "fileformat",
                {
                    "filetype",
                    icon_only = true,
                    separator = "",
                    padding = { left = 1 },
                },
                {
                    function()
                        return require("dap").status()
                    end,
                    cond = function()
                        return package.loaded["dap"] and require("dap").status() ~= ""
                    end,
                },
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        extensions = {
            "man",
            "quickfix",
            "mason",
            "toggleterm",
            "trouble",
            "lazy",
            "nvim-dap-ui",
        },
    },
}
