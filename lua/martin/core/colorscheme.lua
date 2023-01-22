--local status, _ = pcall(vim.cmd, "colorscheme nightfly")
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
	print("Colorscheme nightfly not found!")
	return
end
