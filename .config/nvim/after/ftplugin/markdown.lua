local query = vim.treesitter.query.parse("markdown", "((atx_heading) @header)")
local map = vim.keymap.set
local opt = vim.opt_local
local g = vim.g

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.spell = true
opt.conceallevel = 0
-- opt.conceallevel = 2
opt.concealcursor = ""
opt.list = false
g.vim_markdown_conceal_code_blocks = 0

g.markdown_fenced_languages = {
    "sh",
    "zsh",
    "bash",
    "lua",
    "html",
    "vim",
}

map("n", "<Tab>", function()
    if vim.bo.filetype == "markdown" then
        local current_fold = vim.fn.foldclosed(".")
        if current_fold == -1 then
            vim.cmd("normal! zc")
        else
            vim.cmd("normal! zo")
        end
    end
end, { desc = "Fold toggle markdown files" })

map({ "n", "i" }, "<C-Space>", function()
    local line = vim.api.nvim_get_current_line()
    local modified_line = line:gsub(
        "([-%*+] %[)(.)(%])",
        function(prefix, checkbox, postfix)
            checkbox = (checkbox == " ") and "x" or " "
            return prefix .. checkbox .. postfix
        end
    )
    vim.api.nvim_set_current_line(modified_line)
end, { desc = "Toggle checkboxes", buffer = true })

map({ "n", "i" }, "<C-;>", function()
    local root = vim.treesitter.get_parser():parse()[1]:root()
    local _, node, _ = query:iter_captures(root, 0, vim.fn.line("."), -1)()
    if not node then
        return
    end
    require("nvim-treesitter.ts_utils").goto_node(node)
    vim.cmd("normal zt")
end, { silent = true, buffer = 0, desc = "Next markdown header" })

map({ "n", "i" }, "<C-'>", function()
    local root = vim.treesitter.get_parser():parse()[1]:root()
    if vim.fn.line(".") == 1 then
        return
    end
    local node
    for _, n, _ in query:iter_captures(root, 0, 0, vim.fn.line(".") - 1) do
        node = n
    end
    if not node then
        return
    end
    require("nvim-treesitter.ts_utils").goto_node(node)
    vim.cmd("normal zt")
end, { silent = true, buffer = 0, desc = "Previous markdown header" })

-- Last Modified: Wed, 05 Feb 2025 02:57:23 PM
