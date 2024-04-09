-- return {
--     'NvChad/nvim-colorizer.lua',
--     opts = {
--         user_default_options = {
--             mode = 'background',
--         },
--     },
-- }

return {
    'NvChad/nvim-colorizer.lua',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
}
