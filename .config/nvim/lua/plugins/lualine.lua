return {
    "nvim-lualine/lualine.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
        local colors = require("catppuccin.palettes").get_palette()

        local theme = {
            normal = {
                a = { fg = colors.crust, bg = colors.blue },
                b = { fg = colors.blue, bg = colors.surface0 },
                c = { fg = colors.white, bg = colors.surface0 },
                z = { fg = colors.white, bg = colors.surface0 },
            },
            insert = { a = { fg = colors.crust, bg = colors.orange } },
            visual = { a = { fg = colors.crust, bg = colors.green } },
            replace = { a = { fg = colors.crust, bg = colors.green } },
        }

        local space = {
            function()
                return " "
            end,
        }

        local modecolors = {
            n = colors.pink,
            i = colors.teal,
            v = colors.mauve,
            [""] = colors.mauve,
            V = colors.red,
            c = colors.yellow,
            no = colors.red,
            s = colors.yellow,
            S = colors.yellow,
            [""] = colors.yellow,
            ic = colors.yellow,
            R = colors.green,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.teal,
            rm = colors.teal,
            ["r?"] = colors.teal,
            ["!"] = colors.red,
            t = colors.rosewater,
        }

        local mode_icon = {
            function()
                return ""
            end,
            color = function()
                local mode_color = modecolors
                return { fg = colors.base, bg = mode_color[vim.fn.mode()] }
            end,
            separator = { left = "" },
        }

        local modes = {
            "mode",
            fmt = function(str)
                if str == "NORMAL" then
                    return "N"
                end
                if str == "VISUAL" then
                    return "V"
                end
                if str == "V-LINE" then
                    return "VL"
                end
                if str == "INSERT" then
                    return "I"
                end
                if str == "TERMINAL" then
                    return "T"
                end
                if str == "COMMAND" then
                    return "C"
                end
            end,
            separator = { right = "" },
            color = function()
                local mode_color = modecolors
                return {
                    bg = mode_color[vim.fn.mode()],
                    fg = colors.crust,
                    gui = "bold",
                }
            end,
        }

        local filename = {
            "filename",
            color = { bg = colors.blue, fg = colors.surface0, gui = "bold" },
            separator = { right = "" },
        }

        local branch = {
            "branch",
            icon = "",
            color = { bg = colors.green, fg = colors.surface0, gui = "bold" },
            separator = { left = "", right = "" },
        }

        local diff = {
            "diff",
            color = { bg = colors.surface0, fg = colors.surface0, gui = "bold" },
            separator = { left = "", right = "" },
            symbols = { added = " ", modified = " ", removed = " " },

            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
            },
        }

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            diagnostics_color = {
                error = { fg = colors.red },
                warn = { fg = colors.orange },
                info = { fg = colors.sky },
                hint = { fg = colors.teal },
            },
            separator = { left = "" },
        }

        local lsp = {
            function()
                local msg = ""
                local bunfr = vim.api.nvim_get_current_buf()
                local clients = vim.lsp.get_clients({ bunfr = bunfr })

                if next(clients) == nil then
                    return msg
                end

                local active_lsps = {}
                for _, client in ipairs(clients) do
                    table.insert(active_lsps, client.name)
                end
                return table.concat(active_lsps, ", ")
            end,
            -- icon = " ",
            color = { fg = colors.sapphire, gui = "italic,bold" },
        }

        local location = {
            function()
                local current_line = vim.fn.line(".")
                local total_line = vim.fn.line("$")
                if current_line == 1 then
                    return " Top "
                elseif current_line == vim.fn.line("$") then
                    return " Bot "
                end
                local result, _ = math.modf((current_line / total_line) * 100)
                return " " .. result .. "%% "
            end,
            color = { bg = colors.lavender, fg = colors.surface0, gui = "italic,bold" },
            separator = { left = "", right = "" },
        }

        local linter = {
            function()
                local linters = require("lint").linters_by_ft[vim.bo.filetype] or {}
                if #linters == 0 then
                    return ""
                end
                table.sort(linters)
                return table.concat(linters, " ")
            end,
            color = { fg = colors.peach, gui = "italic,bold" },
        }

        local formatters = {
            function()
                if vim.g.disable_autoformat then
                    return ""
                end

                local formaters = require("conform").list_formatters(0)
                if #formaters == 0 then
                    return ""
                end

                local formaters_table = {}
                for _, formatter in pairs(formaters) do
                    table.insert(formaters_table, formatter.name)
                end

                table.sort(formaters_table)
                return table.concat(formaters_table, " ")
            end,
            color = { fg = colors.green, gui = "italic,bold" },
            -- color = { bg = colors.green, fg = colors.surface0, gui = "italic,bold" },
            -- separator = { left = "", right = "" },
        }

        return {
            options = {
                icons_enabled = true,
                theme = theme,
                component_separators = { left = "", right = "" },
                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    mode_icon,
                    modes,
                },
                lualine_b = {},
                lualine_c = {
                    filename,
                    branch,
                    diff,
                },
                lualine_x = { space },
                lualine_y = {
                    diagnostics,
                    formatters,
                    linter,
                    lsp,
                },
                lualine_z = { location },
            },
            extensions = {
                "man",
                "mason",
                "toggleterm",
                "lazy",
                "nvim-dap-ui",
            },
        }
    end,
}
