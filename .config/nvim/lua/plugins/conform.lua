return {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
        {
            "<leader>af",
            "<cmd>FormatToggle<cr>",
            desc = "Format-on-save toggle",
        },
    },
    opts = function()
        vim.api.nvim_create_user_command("FormatToggle", function(args)
            local is_global = not args.bang
            if is_global then
                vim.g.disable_autoformat = not vim.g.disable_autoformat
            end
        end, { desc = "Toggle autoformat-on-save", bang = true })

        require("conform").formatters.ruff_format =
            { append_args = { "--line-length", "88" } }

        return {
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return {
                    timeout_ms = 3000,
                    lsp_fallback = true,
                }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt", "shellcheck" },
                zsh = { "shellcheck" },
                python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
                markdown = { "prettier", "markdown-toc" },
            },
            formatters = {
                prettier = {
                    prepend_args = {
                        "--tab-width",
                        "2",
                        "--print-width",
                        "80",
                        "--prose-wrap",
                        "always",
                    },
                },
            },
            log_level = vim.log.levels.ERROR,
        }
    end,
}
