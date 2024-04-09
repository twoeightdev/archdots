return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    -- load neo-tree.nvim if we provide a dir as an argument
    init = function()
        if vim.fn.argc(-1) == 1 then
            ---@diagnostic disable-next-line: param-type-mismatch
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == 'directory' then
                require('lazy').load({
                    plugins = { 'neo-tree.nvim' },
                })
            end
        end
    end,
    branch = 'v3.x',
    keys = {
        {
            '<leader>e',
            '<cmd>Neotree toggle<cr>',
            desc = 'Open neo-tree.nvim',
        },
    },
    opts = {
        event_handlers = {
            {
                event = 'file_opened',
                handler = function()
                    -- auto close
                    require('neo-tree.command').execute({ action = 'close' })
                end,
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_by_name = { '.git' },
            },
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
        },
        default_component_configs = {
            indent = {
                with_expanders = true,
                expander_collapsed = '',
                expander_expanded = '',
            },
        },
        window = {
            mappings = {
                ['<space>'] = 'none',
                ['h'] = {
                    function(state)
                        local node = state.tree:get_node()
                        if node.type == 'directory' and node:is_expanded() then
                            require('neo-tree.sources.filesystem').toggle_directory(state, node)
                        else
                            require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                        end
                    end,
                    desc = 'Open directory',
                },
                ['l'] = {
                    function(state)
                        local node = state.tree:get_node()
                        if node.type == 'directory' then
                            if not node:is_expanded() then
                                require('neo-tree.sources.filesystem').toggle_directory(state, node)
                            elseif node:has_children() then
                                require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                            end
                        end
                    end,
                    desc = 'Close directory',
                },
            },
        },
    },
}
