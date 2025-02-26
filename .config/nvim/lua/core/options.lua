local opt = vim.opt
local g = vim.g

-- g.nomore = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showbreak = "↪ "
-- opt.listchars = {
--     tab = "│ ",
--     lead = "·",
--     trail = "·",
--     precedes = "«",
--     extends = "»",
-- }
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
opt.laststatus = 3
opt.spelllang = { "en" }
-- Line numbers
opt.number = true
opt.numberwidth = 5
-- Tabs
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true
-- System clipboard
opt.clipboard = "unnamedplus"
-- Swap file
opt.swapfile = false
-- Terminal truecolor support
opt.termguicolors = true
-- Disable mouse support
opt.mouse = ""
-- Disable text wrapping
opt.wrap = false
-- Don't tabline
opt.showtabline = 0
-- Search
opt.smartcase = true
opt.ignorecase = true
-- Persistent undo
opt.undofile = true
opt.undolevels = 10000
-- Split
opt.splitright = true
opt.splitbelow = true
-- Folds
opt.foldcolumn = "4"
opt.foldlevel = 99
opt.foldlevelstart = 99
-- Scrolloff
opt.scrolloff = 15
opt.sidescrolloff = 0
-- Show invisible characters
opt.list = true
-- Hide markup for bold and italics, but not markers with substitutions
opt.conceallevel = 2
-- Use ripgrep as grep program
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
-- Key timeout to 300ms
opt.timeoutlen = 300
-- opt.ttimeoutlen = 10
-- Update time
opt.updatetime = 200
-- Confirm save changed on exit
opt.confirm = true
-- Keep cursor at the same line when opening a split
opt.splitkeep = "screen"
-- Window configuration
opt.winwidth = 5
opt.winminwidth = 5
opt.equalalways = false
-- Formatting
opt.formatoptions = "jcroqlnt"
-- Completion
opt.completeopt = "menu,menuone,noselect"
opt.wildmode = "longest:full,full"
opt.pumheight = 10
-- Allow cursor to move where there is no text in visual block mode
opt.virtualedit = "block"
-- Partial command letters bellow statusline
opt.showcmd = false
-- Disable text that shows INSERT, VISUAL
opt.showmode = false
-- Cmdheight
opt.cmdheight = 1
-- opt.display:append("uhex")
-- opt.hidden = false
-- Shortmess
opt.shortmess:append({
    S = true,
    s = true,
    W = true,
    I = true,
    c = true,
    C = true,
    A = true,
    F = true,
})
-- Session save options
opt.sessionoptions = {
    "buffers",
    "curdir",
    "tabpages",
    "winsize",
    "help",
    "globals",
    "skiprtp",
    "folds",
    "winpos",
    "resize",
}
opt.autowrite = true

-- Disable lsp logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

-- Disabled provider checkhealth warnings
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Last Modified: Fri, 17 Jan 2025 08:49:51 AM
