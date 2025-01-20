local ui = require("utils.colors")

local set_hl = function(group, options)
    local bg = options.bg == nil and "" or "guibg=" .. options.bg
    local fg = options.fg == nil and "" or "guifg=" .. options.fg
    local gui = options.gui == nil and "" or "gui=" .. options.gui

    vim.cmd(string.format("hi %s %s %s %s", group, bg, fg, gui))
end

local highlights = {
    { "WinBarModified", { fg = ui.kd.c02, gui = "bold" } },
    { "ModifiedTextMain", { fg = ui.kd.c05, gui = "bold" } },
    { "BufferColor", { fg = ui.kd.c03, gui = "bold" } },
}

for _, highlight in ipairs(highlights) do
    set_hl(highlight[1], highlight[2])
end

local function _Spacer(n)
    local spaces = string.rep(" ", n)
    return "%#ModifiedTextMain#" .. spaces
end

local function _Align()
    return "%="
end

local winbar_filetype_exclude = {
    "help",
    "dashboard",
    "lazy",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "toggleterm",
}

if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
    return ""
end

local function BufferNumber()
    local buffer_number = vim.api.nvim_eval_statusline("%n", {}).str
    local hibuff = "%#BufferColor#"

    if buffer_number then
        return hibuff .. "[" .. buffer_number .. "]" .. _Spacer(1)
    end
end

local function FilePath()
    local file_path = vim.api.nvim_eval_statusline("%F", {}).str
    local hipath = "%#ModifiedTextMain#"

    file_path = file_path:gsub("/", " ")
    file_path = file_path:gsub("~", " $HOME")

    if file_path then
        return hipath .. file_path
    end
end

local function SearchMatch()
    if vim.v.hlsearch == 0 then
        return ""
    end

    local last_search = vim.fn.getreg("/")
    if not last_search or last_search == "" then
        return ""
    end

    local ok, searchcount = pcall(vim.fn.searchcount, { maxcount = 9999 })
    if not ok then
        return "Invalid search"
    end
    return last_search .. "[" .. searchcount.current .. "/" .. searchcount.total .. "]"
end

WinBars = function()
    return table.concat({
        BufferNumber(),
        FilePath(),
        _Align(),
        SearchMatch(),
    })
end

vim.api.nvim_create_augroup("WinBars", { clear = true })
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    group = "WinBars",
    pattern = "*",
    callback = function(args)
        if
            not vim.api.nvim_win_get_config(0).zindex
            and vim.bo[args.buf].buftype == ""
            and vim.api.nvim_buf_get_name(args.buf) ~= ""
            and not vim.wo[0].diff
        then
            vim.wo.winbar = "%{%v:lua.WinBars()%}"
        end
    end,
})

-- Last Modified: Sun, 19 Jan 2025 01:57:00 AM
