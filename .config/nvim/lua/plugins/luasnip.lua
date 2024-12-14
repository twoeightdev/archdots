return {
    "L3MON4D3/LuaSnip",
    -- build = "make install_jsregexp",
    lazy = true,
    opts = function()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        -- local i = ls.insert_node
        -- local text = ls.text_node
        local func = ls.function_node
        -- local autosnippet = ls.extend_decorator.apply(s, {
        --     snippetType = "autosnippet",
        -- })

        local timedate = function()
            return { os.date("[%Y-%m-%d %I:%M %p]") }
        end

        -- local date = function()
        --     return { os.date("%Y-%m-%d") }
        -- end

        -- local fulldate = function()
        --     return { os.date("%a, %b %Y/%m/%d - %H:%M:%S") }
        -- end

        -- local return_filename = function()
        --     local filename = vim.fn.fnamemodify(vim.fn.expand("%"), ":p")
        --     local home_dir = vim.fn.expand("~")
        --     if filename:sub(1, #home_dir) == home_dir then
        --         filename = "~/" .. filename:sub(#home_dir + 2)
        --     end
        --     return filename
        -- end

        ls.add_snippets("markdown", {
            s({
                trig = "prettyignore",
                name = "Add prettier ignore start",
            }, {
                t("<!-- prettier-ignore-start -->"),
            }),
            s({
                trig = "tocgen",
                name = "Generate toc",
            }, {
                t({
                    "<!-- toc -->",
                    "<!-- tocstop -->",
                }),
            }),
            s({
                trig = "tdue",
                name = "Date and time",
            }, {
                func(timedate, {}),
            }),
        })

        return {
            enable_autosnippets = true,
        }
    end,
}

-- Last Modified: Sat, 14 Dec 2024 08:39:43 PM
