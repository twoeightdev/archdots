local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup(name, {
        clear = true,
    })
end

autocmd("BufWritePre", {
    group = augroup("whitespaces"),
    command = "%s/\\s\\+$//e",
    desc = "Remove trailing white spaces",
})

autocmd("TextYankPost", {
    group = augroup("yankhighlight"),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = "700",
        })
    end,
    desc = "Highlight text on yank",
})

autocmd("BufWinEnter", {
    group = augroup("no_comment_on_o"),
    command = "setlocal formatoptions-=o",
    desc = "Never insert comment when using 'o' to enter insert mode",
})

autocmd("BufWinEnter", {
    group = augroup("save_cursorpos"),
    pattern = "*",
    command = 'silent! normal! g`"zv',
    desc = "Auto save cursor position on save or exit",
})

autocmd({ "BufEnter", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
    group = augroup("auto_relative_number_on"),
    callback = function()
        if vim.o.number and vim.api.nvim_get_mode() ~= "i" then
            vim.opt.relativenumber = true
        end
    end,
    desc = "Auto toggle on relative number",
})

autocmd({ "BufLeave", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
    group = augroup("auto_relative_number_off"),
    callback = function()
        if vim.o.number then
            vim.opt.relativenumber = false
            vim.cmd.redraw()
        end
    end,
    desc = "Auto toggle off relative number",
})

autocmd("VimResized", {
    group = augroup("auto_balance_resize"),
    command = "tabdo wincmd =",
    desc = "Automatically rebalance windows in resize",
})

autocmd("FileType", {
    group = augroup("wrap_and_spell"),
    pattern = {
        "gitcommit",
        "markdown",
        "text",
        "NeogitCommitMessage",
    },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.wrap = true
    end,
    desc = "Check for spelling of specific filetypes and enable wrapping",
})

autocmd("FileType", {
    group = augroup("json_conceal"),
    pattern = { "json", "jsonc", "json5" },
    callback = function()
        vim.opt_local.conceallevel = 0
    end,
    desc = "Disable conceallevel for json filetypes",
})

autocmd("BufWritePre", {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
    desc = "Auto create dir if nonexistent after save",
})

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    callback = function()
        if vim.opt.buftype:get() ~= "nofile" then
            vim.cmd.checktime()
        end
    end,
    desc = "Check if file needs to reload when changed",
})

autocmd("FileType", {
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
    desc = "Close with just letter q",
})

autocmd("FileType", {
    group = augroup("man_bugfixes"),
    pattern = { "man" },
    callback = function(event)
        vim.opt_local.signcolumn = "no"
        vim.bo[event.buf].buflisted = false
    end,
    desc = "Fix manpage bugs",
})

autocmd("FileType", {
    group = augroup("no_status_dashboard"),
    pattern = { "dashboard" },
    command = "set cmdheight=0",
    desc = "Remove statusline on dashboard",
})

autocmd("BufWritePost", {
    group = augroup("reload_shortcuts"),
    pattern = { "bm-files", "bm-dirs" },
    command = "silent! !shortcuts",
    desc = "Auto reload bin script shortcuts when configuration is updated",
})

autocmd("BufWritePost", {
    group = augroup("reload_xdefaults"),
    pattern = { "xdefaults" },
    command = "silent! !xrdb %",
    desc = "Auto reload xdefaults when configuraton is updated",
})

autocmd("BufWritePost", {
    group = augroup("reload_dunst"),
    pattern = { "dunstrc" },
    command = "silent! !pkill dunst; dunst &",
    desc = "Auto reload dunstrc when configuration is updated",
})
