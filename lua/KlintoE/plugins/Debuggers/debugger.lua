return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local bin_locations = vim.fn.stdpath("data") .. "/mason/bin/"

		local dap = require("dap")
		local dapui = require("dapui")
		require("nvim-dap-virtual-text").setup({})

		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Adapter configurations

		-------------------------------Dart
		dap.adapters.dart = {
			type = "executable",
			command = "flutter",
			-- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
			args = { "debug_adapter" },
		}

		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch Flutter Program",
				-- The nvim-dap plugin populates this variable with the filename of the current buffer
				program = "${file}",
				-- The nvim-dap plugin populates this variable with the editor's current working directory
				cwd = "${workspaceFolder}",
				-- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
				-- Switch chrome to whatever device you want to use for debug such as linux, windows, mac, or a browser etc
				toolArgs = { "-d", "chrome" },
			},
		}

		-------------------------------C/C++/Rust
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			host = "127.0.0.1",
			executable = {
				command = bin_locations .. "codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				runInTerminal = false,
			},
		}
		require("dap").set_log_level("DEBUG")

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		-------------------------------C#
		dap.adapters.coreclr = {
			type = "executable",
			command = bin_locations .. "netcoredbg",
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
				end,
			},
		}
	end,
}
