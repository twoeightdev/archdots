local defaults = {
    -- Pane splitting
    splitright = true,
    splitbelow = true,
    -- Searching
    smartcase = true,
    ignorecase = true,
    -- Terminal truecolor support
    termguicolors = true,
    -- Use system clipboard -> xclip
    clipboard = "unnamedplus",
    -- Old vim status
    showmode = false,
    -- Line numbers
    number = true,
    relativenumber = true,
    numberwidth = 4,
    -- Tabs
    tabstop = 4,
    expandtab = true,
    smartindent = true,
    shiftwidth = 4,
    shiftround = true,
    -- Folds
    foldlevel = 99,
    foldlevelstart = 99,
    foldcolumn = "1",
    -- Update time
    updatetime = 200,
    -- Persistent undo
    undofile = true,
    -- Max number of undo changes
    undolevels = 10000,
    -- Tabline
    showtabline = 0,
    -- Mouse support disable
    mouse = "",
    -- Swapfile
    swapfile = false,
    -- Scrolloff
    scrolloff = 5,
    sidescrolloff = 5,
    -- Wrapping
    wrap = false,
    -- Show invisible characters
    list = true,
    -- Statusline only at the bottom
    laststatus = 0,
    -- Confirm save changed on exit
    confirm = true,
    -- Hide markup for bold and italics, but not markers with substitutions
    conceallevel = 2,
    -- Use ripgrep as grep program for neovim
    grepprg = "rg --vimgrep",
    grepformat = "%f:%l:%c:%m",
    -- Autowrite
    autowrite = true,
    -- Keep cursor at the same line when opening a split
    splitkeep = "screen",
    -- Completions
    completeopt = "menu,menuone,noselect",
    wildmode = "longest:full,full",
    -- Display 10 items in a completion menu
    pumheight = 10,
    -- Keytimeout to 300ms
    timeoutlen = 300,
    -- Window configuration
    winwidth = 5,
    winminwidth = 5,
    equalalways = false,
    -- Signcolumn
    signcolumn = "yes",
    -- Formatting
    formatoptions = "jcroqlnt",
    -- Put cursor at the start of the line for large jumps
    startofline = true,
    -- Allow cursor to move where there is no text in visual block mode
    virtualedit = "block",
    -- Partial command letters below statusline
    showcmd = false,
    -- Enable lazy redraw for performance
    lazyredraw = true,
}

for key, value in pairs(defaults) do
    vim.opt[key] = value
end

local opt = vim.opt
local g = vim.g

-- Shortmess
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Fill chars
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

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

-- Disable LSP logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

-- g.python3_host_prog = "~/.venv/work/mainpy/bin/python"

-- Disabled provider warnings in checkhealth
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
