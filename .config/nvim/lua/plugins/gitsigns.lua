return {
    'lewis6991/gitsigns.nvim',
    init = function()
        vim.api.nvim_create_autocmd({ 'BufRead' }, {
            group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
            callback = function()
                vim.fn.system('git -C ' .. '"' .. vim.fn.expand('%:p:h') .. '"' .. ' rev-parse')
                if vim.v.shell_error == 0 then
                    vim.api.nvim_del_augroup_by_name('GitSignsLazyLoad')
                    vim.schedule(function()
                        require('lazy').load({
                            plugins = { 'gitsigns.nvim' },
                        })
                    end)
                end
            end,
        })
    end,
    ft = 'gitcommit',
    keys = {
        {
            '<leader>gB',
            function()
                return require('gitsigns').blame_line()
            end,
            desc = 'Open git blame',
        },
        {
            '<leader>gp',
            function()
                return require('gitsigns').preview_hunk_inline()
            end,
            desc = 'Preview the hunk',
        },
        {
            '<leader>gr',
            function()
                return require('gitsigns').reset_hunk()
            end,
            mode = { 'n', 'v' },
            desc = 'Reset the hunk',
        },
        {
            '<leader>gR',
            function()
                return require('gitsigns').reset_buffer()
            end,
            desc = 'Reset the buffer',
        },
        {
            '<leader>gs',
            function()
                return require('gitsigns').stage_hunk()
            end,
            mode = { 'n', 'v' },
            desc = 'Stage the hunk',
        },
        {
            '<leader>gS',
            function()
                return require('gitsigns').stage_buffer()
            end,
            desc = 'Stage the buffer',
        },
        {
            '<leader>gu',
            function()
                return require('gitsigns').undo_stage_hunk()
            end,
            desc = 'Unstage the hunk',
        },
        {
            '<leader>gd',
            function()
                return require('gitsigns').diffthis()
            end,
            desc = 'Open a diff',
        },
        {
            '<leader>gq',
            function()
                return require('gitsigns').setqflist()
            end,
            desc = 'Open quickfix list with hunks',
        },
        {
            '<leader>gl',
            function()
                return require('gitsigns').setloclist()
            end,
            desc = 'Open location list with hunks',
        },
        {
            '<leader>gL',
            function()
                return require('gitsigns').toggle_current_line_blame()
            end,
            desc = 'Toggle line blame',
        },
        {
            '<leader>]g',
            function()
                return require('gitsigns').next_hunk()
            end,
            desc = 'Next hunk',
        },
        {
            '[g',
            function()
                return require('gitsigns').prev_hunk()
            end,
            desc = 'Previous hunk',
        },
    },
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '-' },
            topdelete = { text = '-' },
            changedelete = { text = '~' },
        },
        attach_to_untracked = true,
        numhl = true,
    },
}
