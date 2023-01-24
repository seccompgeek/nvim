local status, dap = pcall(require, "nvim-dap")

if not status then
	return
end

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb",
	name = "lldb",
}

dap.configurations.cpp = {
	name = "Launch",
	type = "lldb",
	request = "launch",
	program = function()
		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
	end,
	cwd = "${workspaceFolder}",
	stopOnEntry = false,
	args = {},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
