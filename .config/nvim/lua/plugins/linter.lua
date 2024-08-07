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
            "--disable",
            "MD013",
            "MD004",
            "MD007",
            "MD030",
            "--",
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                local client = vim.lsp.get_clients({ bufnr = 0 })[1] or {}
                require("lint").try_lint(nil, { cwd = client.root_dir })
                -- require("lint").try_lint()
            end,
        })

        -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
        --     callback = function()
        --         local nvim_lint = require("lint")
        --         local linters = nvim_lint.linters_by_ft[vim.bo.filetype] or {}
        --
        --         for _, linter in ipairs(linters) do
        --             local ns = nvim_lint.get_namespace(linter)
        --             vim.diagnostic.reset(ns, 0)
        --         end
        --     end,
        -- })
    end,
}
