return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").clear_prefix("lualine")
			require("transparent").setup({ -- Optional, you don't have to run setup.
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Folded",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"Winbar",
					"CursorLine",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"SignColumn",
					--"VirtualLines",
					"EndOfBuffer",
				},
				extra_groups = {
					"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
					"NvimTreeNormal", -- NvimTree
					"TreesitterContext",
					"TreesitterContextSeparator",
					"TreesitterContextBottom",
					"TreesitterContextLineNumberBottom",
					"TreesitterContextLineNumber",
				}, -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})
			vim.cmd("TransparentEnable")
		end,
	},
}
