return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        linters_by_ft = {
            -- https://github.com/DavidAnson/markdownlint/blob/main/schema/.markdownlint.jsonc
            markdown = { "markdownlint" },
            -- lua = { "selene" },
        },
    },
    config = function(_, opts)
        local lint = require("lint")
        lint.linters_by_ft = opts.linters_by_ft

        lint.linters.markdownlint.args = {
            "--config",
            os.getenv("HOME") .. "/.config/nvim/.markdownlint.yaml",
            "--",
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
            desc = "Linters",
            group = lint_augroup,
            callback = function()
                local client = vim.lsp.get_clients({ bufnr = 0 })[1] or {}
                lint.try_lint(nil, { cwd = client.root_dir })
                -- lint.try_lint()
            end,
        })
    end,
}
