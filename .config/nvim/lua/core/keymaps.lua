local map = vim.keymap.set

-- Set space as my leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the space key
map({ 'n', 'v' }, '<Space>', '<Nop>', { expr = true, silent = true })

-- Disable Ex mode
-- map('', 'Q', '<Nop>')
-- Disable record
-- map('', 'q', '<Nop>')

-- General keymaps
map('n', '<leader>w', vim.cmd.w, { desc = 'Save file' })
map('n', '<leader>q', vim.cmd.qa, { desc = 'Quit without saving' })
-- map('n', '<leader>c', ':noh<cr>', { desc = 'Clear hlsearch' })

-- Open lazy.nvim
map('n', '<leader>l', vim.cmd.Lazy, { desc = 'Open lazy.nvim' })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Previous search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Previous search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Previous search result' })

-- Window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Navigate to left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Navigate to bottom' })
map('n', '<C-k>', '<C-w>k', { desc = 'Navigate to top' })
map('n', '<C-l>', '<C-w>l', { desc = 'Navigate to right' })

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

map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- Switch to other buffer
map('n', '<leader>bb', '<cmd>e #<CR>', { desc = 'Switch to other buffer' })

-- Better up/down
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

-- Add undo breakpoints
map('i', ',', ',<C-g>u')
map('i', '.', '.<C-g>u')
map('i', ';', ';<C-g>u')

-- Do not copy anything with x or c
map({ 'n', 'v' }, 'x', '"_x', { noremap = true, silent = true })
map({ 'n', 'v' }, 'c', '"_c', { noremap = true, silent = true })

-- Only cut with dd when the line contains something
---@return string
map('n', 'dd', function()
    if vim.fn.getline('.') == '' then
        return '"_dd'
    end
    return 'dd'
end, { expr = true })
