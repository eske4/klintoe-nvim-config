return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

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

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debugger toggle breakpoint" })
		vim.keymap.set("n", "<leader>dsb", dap.set_breakpoint, { desc = "Debugger set breakpoint" })
		vim.keymap.set("n", "<leader>dsm", dap.step_over, { desc = "Debugger step over" })
		vim.keymap.set("n", "<leader>dsM", dap.step_into, { desc = "Debugger step into" })
		vim.keymap.set("n", "<leader>dso", dap.step_out, { desc = "Debugger step out" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debugger continue" })
		vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debugger restart" })
		vim.keymap.set("n", "<leader>dsc", dap.restart, { desc = "Debugger step to cursor" })
		vim.keymap.set("n", "<leader>dq", function()
			dap.disconnect({ terminateDebuggee = true })
			dapui.close()
		end, { desc = "Debugger quit" })

		dap.adapters.dart = {
			type = "executable",
			command = "dart",
			-- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
			args = { "debug_adapter" },
		}
		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch Dart Program",
				-- The nvim-dap plugin populates this variable with the filename of the current buffer
				program = "${file}",
				-- The nvim-dap plugin populates this variable with the editor's current working directory
				cwd = "${workspaceFolder}",
				args = { "--help" }, -- Note for Dart apps this is args, for Flutter apps toolArgs
			},
		}

		-- For C/C++/Rust:

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "/usr/bin/lldb-vscode",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
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
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
