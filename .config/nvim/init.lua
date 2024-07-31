-- Experimental loader
vim.loader.enable()

-- Use pcall to load modules
local function safereq(module)
	local success, loaded = pcall(require, module)
	if success then
		return loaded
	end
end

-- Load modules
safereq("core.options")
safereq("core.keymaps")
safereq("core.autocmds")
safereq("core.bootstrap")
