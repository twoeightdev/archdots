return {
    {
        -- nvim-lspconfig
        "neovim/nvim-lspconfig",
        dependencies = {
            -- neodev.nvim
            { "folke/neodev.nvim", config = true },
            {
                -- mason.nvim
                "williamboman/mason.nvim",
                cmd = "Mason",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                    log_level = vim.log.levels.OFF,
                },
            },
            {
                -- mason-lspconfig.nvim
                "williamboman/mason-lspconfig.nvim",
                cmd = { "LspInstall", "LspUninstall" },
                opts = {
                    ensure_installed = {
                        "lua_ls",
                        "pylsp",
                        "bashls",
                        "marksman",
                        "taplo",
                    },
                },
            },
        },
        keys = {
            {
                "gd",
                function()
                    return require("telescope.builtin").lsp_definitions()
                end,
                desc = "Goto Definition",
            },
            {
                "gi",
                function()
                    return require("telescope.builtin").lsp_implementations()
                end,
                desc = "Goto Implementation",
            },
            {
                "gy",
                function()
                    return require("telescope.builtin").lsp_type_definitions()
                end,
                desc = "Goto T[y]pe Definition",
            },
            { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
            { "K", vim.lsp.buf.hover, desc = "Hover" },
            { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local signs = {
                Error = "◾",
                Warn = "◾",
                Hint = "◾",
                Info = "🞼 ",
            }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Diagnostic settings
            local diagnostic_settings = {
                virtual_text = false,
                signs = {
                    active = signs,
                },
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }
            vim.diagnostic.config(diagnostic_settings)

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                log_level = 0,
                settings = {
                    Lua = {
                        diagnostics = {
                            disable = { "missing-fields" },
                            globals = { "vim" },
                        },
                        workspace = { checkThirdParty = false },
                        completion = { callSnippet = "Replace" },
                    },
                },
            })
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            flake8 = {
                                enabled = true,
                                maxLineLength = 88,
                            },
                            -- Disable plugins overlapping with flake8
                            pycodestyle = {
                                enabled = false,
                            },
                            mccabe = {
                                enabled = false,
                            },
                            pyflakes = {
                                enabled = false,
                            },
                            autopep8 = {
                                enabled = false,
                            },
                        },
                    },
                },
            })
            -- lspconfig.bashls.setup({ filetypes = { "sh", "zsh", "bash" } })
            lspconfig.marksman.setup({})
            lspconfig.taplo.setup({})
        end,
    },
    {
        -- none-ls.nvim
        "nvimtools/none-ls.nvim",
        main = "null-ls",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvimtools/none-ls-extras.nvim",
            {
                -- mason-null-ls.nvim
                "jay-babu/mason-null-ls.nvim",
                dependencies = "williamboman/mason.nvim",
                cmd = {
                    "NullLsInstall",
                    "NullLsUninstall",
                    "NoneLsInstall",
                    "NoneLsUninstall",
                },
                opts = {
                    ensure_installed = {
                        "stylua",
                        "selene",
                        "markdownlint",
                        "mdformat",
                        "beautysh",
                        "isort",
                        "black",
                        "flake8",
                        "debugpy",
                    },
                    handlers = {},
                },
            },
        },
        event = { "BufReadPre", "BufNewFile" },
        opts = function()
            local nls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            return {
                log_level = "off",
                sources = {
                    -- lua
                    nls.builtins.formatting.stylua,
                    nls.builtins.diagnostics.selene,
                    -- python
                    nls.builtins.formatting.isort,
                    nls.builtins.formatting.black,
                    -- markdown
                    nls.builtins.formatting.mdformat,
                    nls.builtins.diagnostics.markdownlint,
                    -- shell
                    require("none-ls.formatting.beautysh"),
                    nls.builtins.diagnostics.zsh,
                    -- code actions
                    nls.builtins.code_actions.gitrebase,
                },
                on_attach = function(client, bufnr)
                    -- Autoformat on save if supported
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    async = false,
                                    bufnr = bufnr,
                                    -- Only use none-ls.nvim for formatting
                                    -- selene: allow(shadowing)
                                    ---@diagnostic disable-next-line: redefined-local
                                    filter = function(client)
                                        return client.name == "null-ls"
                                    end,
                                })
                            end,
                        })
                    end
                end,
            }
        end,
    },
}
