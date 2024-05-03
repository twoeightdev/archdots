local opt = vim.opt_local
local g = vim.g

opt.expandtab = true
opt.autoindent = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.textwidth = 88

g.pyindent_open_paren = vim.bo.shiftwidth
