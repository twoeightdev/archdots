local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup(name, {
        clear = true,
    })
end

autocmd({ "BufEnter", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
    desc = "Auto toggle on relative number",
    group = augroup("auto_relative_number_on"),
    callback = function()
        if vim.o.number and vim.api.nvim_get_mode() ~= "i" then
            vim.opt.relativenumber = true
        end
    end,
})

autocmd({ "BufLeave", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
    desc = "Auto toggle off relative number",
    group = augroup("auto_relative_number_off"),
    callback = function()
        if vim.o.number then
            vim.opt.relativenumber = false
            vim.cmd.redraw()
        end
    end,
})

autocmd("BufWritePre", {
    desc = "Remove trailing white spaces",
    group = augroup("whitespaces"),
    command = "%s/\\s\\+$//e",
})

autocmd("TextYankPost", {
    desc = "Highlight text on yank",
    group = augroup("yankhighlight"),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = "700",
        })
    end,
})

autocmd("BufWinEnter", {
    desc = "Never insert comment when using 'o' to enter insert mode",
    group = augroup("no_comment_on_o"),
    callback = function()
        vim.opt.formatoptions:remove({ "o" })
    end,
})

autocmd("BufReadPost", {
    desc = "Auto save cursor position",
    group = augroup("save_cursor_position"),
    pattern = "*",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

autocmd("FileType", {
    desc = "Close with just letter q",
    group = augroup("close_with_q"),
    pattern = {
        "help",
        "lspinfo",
        "checkhealth",
        "qf",
        "query",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", vim.cmd.close, {
            buffer = event.buf,
            silent = true,
        })
    end,
})

autocmd("BufWritePre", {
    desc = "Auto create dir if nonexistent after save",
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

autocmd("FileType", {
    desc = "Fix manpage bugs",
    group = augroup("man_bugfixes"),
    pattern = { "man" },
    callback = function(event)
        vim.opt_local.signcolumn = "no"
        vim.bo[event.buf].buflisted = false
    end,
})

autocmd("FileType", {
    desc = "Org files defaults",
    group = augroup("orgmode_defaults"),
    pattern = "org",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.wrap = false
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "nc"
        vim.opt.formatoptions:remove({ "r" })
        -- vim.opt.relativenumber = false
        -- vim.opt.number = false
        -- vim.opt_local.foldenable = false
    end,
})

autocmd("FileType", {
    desc = "Check for spelling of specific filetypes and enable wrapping",
    group = augroup("wrap_and_spell"),
    pattern = {
        "gitcommit",
        "text",
        "NeogitCommitMessage",
    },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.wrap = true
    end,
})

autocmd("FileType", {
    desc = "Markdown defaults",
    group = augroup("markdown_default"),
    pattern = "markdown",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.wrap = true
        vim.opt_local.conceallevel = 0
        -- vim.opt.foldmethod = "expr"
        -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt_local.foldenable = true
    end,
})

autocmd("FileType", {
    desc = "Disable conceallevel for json filetypes",
    group = augroup("json_conceal"),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
})

autocmd("FileType", {
    desc = "Remove statusline on dashboard",
    group = augroup("no_status_dashboard"),
    pattern = { "dashboard" },
    callback = function()
        vim.opt_local.cmdheight = 0
    end,
})

autocmd("BufWritePost", {
    desc = "Auto reload bin script shortcuts when configuration is updated",
    group = augroup("reload_shortcuts"),
    pattern = { "bm-files", "bm-dirs" },
    command = "silent! !shortcuts",
})

autocmd("BufWritePost", {
    desc = "Auto reload xdefaults when configuraton is updated",
    group = augroup("reload_xdefaults"),
    pattern = { "xdefaults" },
    command = "silent! !xrdb %",
})

autocmd("BufWritePost", {
    desc = "Auto reload dunstrc when configuration is updated",
    group = augroup("reload_dunst"),
    pattern = { "dunstrc" },
    command = "silent! !pkill dunst; dunst &",
})
