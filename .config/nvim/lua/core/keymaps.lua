local map = vim.keymap.set
local del = vim.keymap.del

-- Set space as my leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the space key
-- map({ "n", "v" }, "<Space>", "<Nop>", { expr = true, silent = true })

-- General keymaps
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Write" })
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })
map("n", "<leader>an", "<cmd>enew<cr>", { desc = "New file" })
map("n", "<leader><tab>d", ":bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader><tab>h", ":new<cr>", { desc = "Horizontal split" })
map("n", "<leader><tab>v", ":vnew<cr>", { desc = "Vertical split" })
map({ "n", "o" }, "<c-'>", "gcc", { remap = true, desc = "Line comment" })
map({ "n", "x" }, "<c-;>", "gc", { remap = true, desc = "Block comment" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlseach" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Previous search" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous search" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous search" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Navigate left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate bottom window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate top window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate right window", remap = true })

-- Resize window
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Toggleterm navigation
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter normal mode" })
map("t", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Navigate left window" })
map("t", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Navigate lower window" })
map("t", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Navigate upper window" })
map("t", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Navigate right window" })
del("t", "<c-l>", { desc = "Clear toggleterm" })

-- Disable Ex mode
map("", "Q", "<nop>")
-- Disable record
map("", "q", "<nop>")

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Jump to diagnostics
---@param next boolean
---@param severity any
---@return function
local function diagnostic_goto(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end

map("n", "]d", diagnostic_goto(true), { desc = "Next diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Previous diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Previous error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Previous warning" })

-- Better up/down
map(
    { "n", "x" },
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    { desc = "Down", expr = true, silent = true }
)
map(
    { "n", "x" },
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    { desc = "Up", expr = true, silent = true }
)

-- Add undo breakpoints
-- map("i", ",", ",<C-g>u")
-- map("i", ".", ".<C-g>u")
-- map("i", ";", ";<C-g>u")

-- Do not copy anything with x or c
map({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
map({ "n", "v" }, "c", '"_c', { noremap = true, silent = true })

-- Only cut with dd when the line contains something
---@return string
map("n", "dd", function()
    if vim.fn.getline(".") == "" then
        return '"_dd'
    end
    return "dd"
end, { expr = true })

map("n", "<leader>di", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { desc = "Inlay hints" })
