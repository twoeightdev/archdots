local better_defaults = {
    -- Cursor highlighting
    -- cursorline = true,
    -- cursorcolumn = true,
    -- Pane splitting
    splitright = true,
    splitbelow = true,
    -- Searching
    smartcase = true,
    ignorecase = true,
    -- Terminal truecolor support
    termguicolors = true,
    -- Use system clipboard
    clipboard = "unnamedplus",
    -- Disable old vim status
    showmode = false,
    -- Set relative line numbers
    number = true,
    -- relativenumber = true,
    numberwidth = 4,
    -- Tab config
    expandtab = true,
    smartindent = true,
    shiftwidth = 4,
    tabstop = 4,
    shiftround = true,
    -- Code folding
    foldlevel = 99,
    foldlevelstart = 99,
    foldcolumn = "1",
    -- Decrease update time
    updatetime = 200,
    -- Enable persistent undo
    undofile = true,
    -- Always show tabline
    showtabline = 0,
    -- Disable mouse support
    mouse = "",
    -- Scrolloff
    scrolloff = 5,
    sidescrolloff = 5,
    -- Disable wrapping
    wrap = false,
    -- Show invisible characters
    list = true,
    -- Have the statusline only display at the bottom
    laststatus = 0,
    -- Confirm to save changed before exiting the modified buffer
    confirm = true,
    -- Hide markup for bold and italic, but not markers with substitutions
    conceallevel = 2,
    -- Use ripgrep as the grep program for neovim
    grepprg = "rg --vimgrep",
    grepformat = "%f:%l:%c:%m",
    -- Enable autowrite
    autowrite = true,
    -- Keep cursor to the same screen line when opening a split
    splitkeep = "screen",
    -- Set completion options
    completeopt = "menu,menuone,noselect",
    -- Set key timeout to 300ms
    timeoutlen = 300,
    -- Window configuration
    winwidth = 5,
    winminwidth = 5,
    equalalways = false,
    -- Always show the signcolumn
    signcolumn = "yes",
    -- Formatting options
    formatoptions = "jcroqlnt",
    -- Put the cursor at the start of the line for large jumps
    startofline = true,
    -- Allow cursor to move where this is no text is visual block mode
    virtualedit = "block",
    -- Command-line completion mode
    wildmode = "longest:full,full",
    -- Maximum number of undo changes
    undolevels = 10000,
    -- Only display 10 items in a completion menu
    pumheight = 10,
    -- Disable swap file
    swapfile = false,
    -- Don't show partial command letters below statusline
    showcmd = false,
    -- Don't show commandline
    cmdheight = 0,
}
for key, value in pairs(better_defaults) do
    vim.opt[key] = value
end

local opt = vim.opt
local g = vim.g

-- shortmess options
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

-- Disable lsp logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

--g.python3_host_prog = '~/.local/work/pythonvenv/pymain/bin/python3'

-- Disable provider warnings in the healthcheck
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
