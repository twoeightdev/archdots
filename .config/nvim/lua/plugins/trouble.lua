return {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = { use_diagnostic_signs = true },
    keys = {
        {
            '<leader>xx',
            function()
                return require('trouble').toggle()
            end,
            desc = 'Toggle trouble.nvim',
        },
        {
            '<leader>xw',
            function()
                return require('trouble').toggle('workspace_diagnostics')
            end,
            desc = 'Open workspace diagnostics',
        },
        {
            '<leader>xd',
            function()
                return require('trouble').toggle('document_diagnostics')
            end,
            desc = 'Open document diagnostics',
        },
        {
            '<leader>xq',
            function()
                return require('trouble').toggle('quickfix')
            end,
            desc = 'Open quickfix',
        },
        {
            '<leader>xl',
            function()
                return require('trouble').toggle('loclist')
            end,
            desc = 'Open location list',
        },
        {
            'gR',
            function()
                return require('trouble').toggle('lsp_references')
            end,
            desc = 'References',
        },
        {
            '[q',
            function()
                if require('trouble').is_open() then
                    require('trouble').previous({
                        skip_groups = true,
                        jump = true,
                    })
                else
                    local ok, err = pcall(vim.cmd.cprevious)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = 'Previous trouble/quickfix item',
        },
        {
            ']q',
            function()
                if require('trouble').is_open() then
                    require('trouble').next({
                        skip_groups = true,
                        jump = true,
                    })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = 'Next trouble/quickfix item',
        },
        {
            '<leader>xt',
            '<cmd>TodoTrouble<CR>',
            desc = 'Todo (Trouble)',
        },
        {
            '<leader>xT',
            '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>',
            desc = 'Todo/Fix/Fixme (Trouble)',
        },
    },
}
