return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    --commit = "b356f2c",
    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "windwp/nvim-autopairs",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
        },
        {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
    },
    opts = function()
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local function has_words_before()
            ---@diagnostic disable-next-line: deprecated
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0
                and vim.api
                        .nvim_buf_get_lines(0, line - 1, line, true)[1]
                        :sub(col, col)
                        :match("%s")
                    == nil
        end
        return {
            completion = { completeopt = "menu,menuone,noinsert" },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({
                            behavior = cmp.SelectBehavior.Insert,
                        })
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({
                            behavior = cmp.SelectBehavior.Insert,
                        })
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
                ["<S-cr>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<C-cr>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 100 },
                { name = "luasnip", priority = 60 },
                { name = "buffer", priority = 40 },
                { name = "path", priority = 30 },
                { name = "treesitter" },
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, item)
                    local kind = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        menu = {
                            nvim_lsp = "LSP",
                            luasnip = "Snippet",
                            orgmode = "orgmode",
                            buffer = "Buffer",
                            path = "Path",
                        },
                    })(entry, item)

                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    [" .. kind.menu .. "]"
                    -- kind.menu = "    (" .. (strings[2] or "") .. ")"

                    return kind
                end,
            },
            experimental = {
                ghost_text = { hl_group = "CmpGhostText" },
            },
            window = {
                completion = {
                    scrollbar = false,
                    border = "single",
                    winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
                },
                documentation = {
                    border = "single",
                    winhighlight = "Normal:CmpDoc",
                },
            },
            view = {
                entries = {
                    name = "custom",
                    selection_order = "near_cursor",
                },
            },
        }
    end,
    config = function(_, opts)
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.setup(opts)
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } },
        })
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
            }),
        })
        -- nvim-autopairs integration
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
