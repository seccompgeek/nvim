local status, _ = pcall(vim.cmd, "colorscheme noctis")

if not status then
	print("Colorscheme nightfly not found!")
	return
end
