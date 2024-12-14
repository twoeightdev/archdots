return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_pending = " ",
                    package_installed = "󰄳 ",
                    package_uninstalled = "󰚌 ",
                },
            },
            log_level = vim.log.levels.OFF,
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "marksman",
                "bash-language-server",
                "stylua",
                "markdownlint",
                "shfmt",
                "shellcheck",
                "markdown-toc",
                "prettier",
                "ruff",
                "pyright",
                "yaml-language-server",
                "json-lsp",
                "debugpy",
            },
            run_on_start = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
        },
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            diagnostics = {
                underline = false,
                severity_sort = true,
                signs = false,
                -- signs = {
                --     Error = " ",
                --     Warn = " ",
                --     Hint = "",
                --     Info = " ",
                -- },
                virtual_text = {
                    prefix = "",
                    -- source = false,
                    format = function()
                        return "◾"
                    end,
                },
                float = {
                    border = "single",
                    source = true,
                    header = "",
                    format = function(diagnostic) -- prefix
                        return diagnostic.message
                    end,
                },
            },
            servers = {
                lua_ls = {
                    log_level = 0,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = { checkThirdParty = false },
                            completion = { callSnippet = "Replace" },
                            doc = {
                                privateName = { "^_" },
                            },
                            hint = {
                                enable = true,
                                arrayIndex = "Disable",
                            },
                        },
                    },
                },
                marksman = {},
                bashls = {
                    filetypes = {
                        "sh",
                        "zsh",
                        "bash",
                    },
                },
                pyright = {
                    settings = {
                        pyright = {
                            disableOrganizeImports = true,
                        },
                        python = {
                            analysis = {
                                typeCheckingMode = "standard",
                                diagnosticSeverityOverrides = {
                                    reportPrivateImportUsage = false,
                                    reportArgumentType = false,
                                },
                            },
                        },
                    },
                },
                yamlls = {
                    settings = {
                        yaml = {
                            format = {
                                enable = true,
                            },
                        },
                    },
                },
                jsonls = {
                    settings = {
                        json = {
                            format = {
                                enable = true,
                            },
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            local lspconfig = require("lspconfig")

            --NOTE: Uncomment this if using diagnostics.signs
            -- for type, icon in pairs(opts.diagnostics.signs) do
            --     local hl = "DiagnosticSign" .. type
            --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            -- end

            vim.diagnostic.config({
                virtual_text = opts.diagnostics.virtual_text,
                severity_sort = opts.diagnostics.severity_sort,
                float = opts.diagnostics.float,
                underline = opts.diagnostics.underline,
                signs = opts.diagnostics.signs,
            })

            for server, config in pairs(opts.servers) do
                lspconfig[server].setup(config)
            end
        end,
    },
}

-- Last Modified: Fri, 13 Dec 2024 02:19:47 AM
