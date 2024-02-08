-- Good default colorschemes: torte, slate
local default_colorschmee = "slate"

local function setColorScheme(colorscheme, bg_op)
	if colorscheme == nil then -- No colorscheme provided
		colorscheme = default_colorschmee -- Default colorscheme
	end

	-- Check if colorscheme exists
	local status_ok, _ = pcall(vim.cmd, ("colorscheme " .. colorscheme))
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end

	-- Set background opacity if set
	if bg_op then
		-- vim.cmd('highlight Normal guibg=none')
		vim.cmd('highlight Normal guibg=#000000' .. bg_op)
	end
end

-- Set colorscheme if "setColorScheme" is not executed on "init.lua"
setColorScheme(default_colorschmee)

return {
	setColorScheme = setColorScheme
};
