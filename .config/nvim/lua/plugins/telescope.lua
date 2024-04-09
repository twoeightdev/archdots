return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end,
        },
    },
    branch = '0.1.x',
    cmd = 'Telescope',
    keys = {
        {
            '<leader>ff',
            function()
                return require('telescope.builtin').find_files()
            end,
            desc = 'Files',
        },
        {
            '<leader>fw',
            function()
                return require('telescope.builtin').live_grep()
            end,
            desc = 'Words',
        },
        {
            '<leader>fb',
            function()
                return require('telescope.builtin').buffers()
            end,
            desc = 'Buffers',
        },
        {
            '<leader>fh',
            function()
                return require('telescope.builtin').help_tags()
            end,
            desc = 'Help',
        },
        {
            '<leader>fm',
            function()
                return require('telescope.builtin').man_pages()
            end,
            desc = 'Man Pages',
        },
        {
            '<leader>fr',
            function()
                return require('telescope.builtin').oldfiles()
            end,
            desc = 'Recently opened',
        },
        {
            '<leader>fR',
            function()
                return require('telescope.builtin').registers()
            end,
            desc = 'Registers',
        },
        {
            '<leader>fk',
            function()
                return require('telescope.builtin').keymaps()
            end,
            desc = 'Keymaps',
        },
        {
            '<leader>fc',
            function()
                return require('telescope.builtin').commands()
            end,
            desc = 'Commands',
        },
        {
            '<leader>fC',
            function()
                return require('telescope.builtin').command_history()
            end,
            desc = 'Command history',
        },
        {
            '<leader>fl',
            function()
                return require('telescope.builtin').resume()
            end,
            desc = 'Resume',
        },
        {
            '<leader>fd',
            function()
                return require('telescope.builtin').diagnostics({ bufnr = 0 })
            end,
            desc = 'Document diagnostics',
        },
        {
            '<leader>fD',
            function()
                return require('telescope.builtin').diagnostics()
            end,
            desc = 'Workspace diagnostics',
        },
        {
            '<leader>fs',
            function()
                return require('telescope.builtin').lsp_document_symbols()
            end,
            desc = 'Docment symbols',
        },
        {
            '<leader>fg',
            function()
                return require('telescope.builtin').git_files()
            end,
            desc = 'Git files',
        },
        {
            '<leader>ft',
            '<cmd>TodoTelescope<cr>',
            desc = 'Todo',
        },
        {
            '<leader>fT',
            '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>',
            desc = 'Todo/Fix/Fixme',
        },
        {
            '<leader>gc',
            function()
                return require('telescope.builtin').git_status()
            end,
            desc = 'Search through changed files',
        },
        {
            '<leader>gb',
            function()
                return require('telescope.builtin').git_branches()
            end,
            desc = 'Search through git branches',
        },
        {
            '<leader>gC',
            function()
                return require('telescope.builtin').git_commits()
            end,
            desc = 'Search and checkout git commits',
        },
    },
    opts = function()
        -- File and text search in hidden files and dir
        local telescopeConfig = require('telescope.config')
        -- Clone the default Telescope configuration
        local vimgrep_arguments = {
            unpack(telescopeConfig.values.vimgrep_arguments),
        }
        local actions = require('telescope.actions')
        -- Search in hidden/dot files
        table.insert(vimgrep_arguments, '--hidden')
        -- Dont search in .git directory
        table.insert(vimgrep_arguments, '--glob')
        table.insert(vimgrep_arguments, '!**/.git/*')

        return {
            defaults = {
                prompt_prefix = ' ',
                selection_caret = ' ',
                mappings = { n = { ['q'] = actions.close } },
                vimgrep_arguments = vimgrep_arguments,
                theme = 'gruvbox',
                path_display = { 'smart' },
                file_ignore_patterns = { '.git/' },
                layout_strategy = 'horizontal',
                layout_config = { prompt_position = 'top' },
                sorting_strategy = 'ascending',
            },
            pickers = {
                find_files = {
                    find_command = {
                        'rg',
                        '--files',
                        '--hidden',
                        '--glob',
                        '!**/.git/*',
                    },
                },
            },
        }
    end,
}
