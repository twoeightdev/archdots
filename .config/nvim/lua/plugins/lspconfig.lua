return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
        {
            "williamboman/mason.nvim",
            cmd = "Mason",
            opts = {
                ui = {
                    icons = {
                        package_pending = " ",
                        package_installed = "󰄳 ",
                        package_uninstalled = "󰚌 ",
                    },
                },
                log_level = vim.log.levels.OFF,
                ensure_installed = {
                    "stylua",
                    "shfmt",
                    "shellcheck",
                    "markdown-toc",
                    "prettier",
                    "markdownlint",
                },
            },
            config = function(_, opts)
                require("mason").setup(opts)
                local masonreg = require("mason-registry")
                local function ensure_installed()
                    for _, tool in ipairs(opts.ensure_installed) do
                        local p = masonreg.get_package(tool)
                        if not p:is_installed() then
                            p:install()
                        end
                    end
                end
                if masonreg.refresh then
                    masonreg.refresh(ensure_installed)
                else
                    ensure_installed()
                end
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            cmd = { "LspInstall", "LspUninstall" },
            opts = {
                ensure_installed = {
                    "bashls",
                    "lua_ls",
                    "yamlls",
                    "jsonls",
                    "marksman",
                    "basedpyright",
                    "ruff_lsp",
                },
            },
        },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local signs =
            { Error = " ", Warn = " ", Hint = "", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(
                hl,
                { text = icon, texthl = "", linehl = "", numhl = "" }
            )
        end

        vim.diagnostic.config({
            signs = false,
            underline = false,
            update_in_insert = false,
            severity_sort = true,
            float = {
                style = "minimal",
                border = "single",
                source = true,
                header = "",
                prefix = "",
            },
            virtual_text = {
                prefix = "",
                source = false,
                format = function()
                    return "◾"
                end,
            },
        })

        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
        })

        lspconfig.lua_ls.setup({
            log_level = 0,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    -- diagnostics = { enable = false },
                    workspace = { checkThirdParty = false },
                    completion = { callSnippet = "Replace" },
                },
            },
        })

        lspconfig.ruff_lsp.setup({})
        lspconfig.basedpyright.setup({
            settings = {
                basedpyright = {
                    analysis = {
                        typeCheckingMode = "standard",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        autoImportCompletions = true,
                        diagnosticsMode = "openFilesOnly",
                        diagnosticSeverityOverrides = {
                            reportMissingImports = false,
                            reportUnusedImport = false,
                            reportTypeCommentUsage = false,
                            reportPrivateImportUsage = false,
                            reportArgumentType = false,
                            reportUnknownMemberType = false,
                            reportUnknownArgumentType = false,
                            reportUndefinedVariable = false,
                        },
                    },
                },
            },
        })

        lspconfig.bashls.setup({
            filetypes = { "sh", "zsh", "bash" },
        })

        lspconfig.yamlls.setup({
            settings = {
                yaml = {
                    format = {
                        enable = true,
                    },
                },
            },
        })

        lspconfig.jsonls.setup({
            settings = {
                json = {
                    format = {
                        enable = true,
                    },
                },
            },
        })

        lspconfig.marksman.setup({})
    end,
}
