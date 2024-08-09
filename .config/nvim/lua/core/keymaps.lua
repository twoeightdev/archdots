local map = vim.keymap.set
local del = vim.keymap.del
local opts = { expr = true, silent = true }
local noremaps = { noremap = true, silent = true }
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

-- Disable Ex mode
map("", "Q", "<nop>")
-- Disable record
map("", "q", "<nop>")

-- Basic
map("n", "<leader>an", "<cmd>enew<cr>", { desc = "New file" })
map("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Write" })
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })
map({ "n", "o" }, "<c-'>", "gcc", { remap = true, desc = "Line comment" })
map({ "n", "x" }, "<c-;>", "gc", { remap = true, desc = "Block comment" })
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlseach" })

-- Window/Buffers/Splits
map("n", "<leader><tab>h", ":new<cr>", { desc = "Horizontal split" })
map("n", "<leader><tab>v", ":vnew<cr>", { desc = "Vertical split" })
map("n", "<leader><tab>d", ":bdelete<cr>", { desc = "Delete buffer" })
map("n", "<C-h>", "<C-w>h", { desc = "Navigate left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate bottom window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Navigate top window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate right window", remap = true })
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

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search" })
map({ "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Previous search" })
map({ "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Previous search" })

-- Better up and down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", opts)
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", opts)

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Do not copy anything with x or c
map({ "n", "v" }, "x", '"_x', noremaps)
map({ "n", "v" }, "c", '"_c', noremaps)

-- Only cut with dd when the line contains something
map("n", "dd", function()
    if vim.fn.getline(".") == "" then
        return '"_dd'
    end
    return "dd"
end, { expr = true })

-- Toggleterm navigation
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter normal mode" })
map("t", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Navigate left window" })
map("t", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Navigate lower window" })
map("t", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Navigate upper window" })
map("t", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Navigate right window" })
del("t", "<c-l>", { desc = "Clear toggleterm" })

-- Jump to diagnostics
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

-- Inlay hints
map("n", "<leader>li", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { desc = "Inlay hints" })
