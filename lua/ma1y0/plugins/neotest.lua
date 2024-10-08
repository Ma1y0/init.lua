return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- Language-specific adapters
		"rouge8/neotest-rust", -- Rust adapter
		"jfpedroza/neotest-elixir", -- Elixir adapter
		"nvim-neotest/neotest-go", -- Go adapter
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-rust")({
					-- Optional args for rust adapter
					args = {
						"--no-capture", -- Show println! output
					},
					-- Uncomment to use alternative rust test runners
					-- dap_adapter = "lldb",  -- Used by nvim-dap
				}),
				require("neotest-elixir")({
					-- Optional: Set the test command
					-- args = {"test"}  -- Default command is "mix test"
					-- Optional: Set the test directory
					-- test_dir = "test"  -- Default directory
				}),
				require("neotest-go")({
					-- Optional: Set experimental mode for better handling of test output
					experimental = {
						test_table = true,
					},
				}),
			},
			-- Global settings
			discovery = {
				enabled = true,
			},
			diagnostic = {
				enabled = true,
			},
			status = {
				enabled = true,
				signs = true,
				virtual_text = true,
			},
			output = {
				enabled = true,
				open_on_run = true,
			},
			summary = {
				enabled = true,
				expand_errors = true,
				follow = true,
				mappings = {
					expand = { "<CR>", "<2-LeftMouse>" },
					expand_all = "e",
					output = "o",
					short = "O",
					attach = "a",
					jumpto = "i",
					stop = "u",
					run = "r",
					debug = "d",
					mark = "m",
				},
			},
		})

		-- Optional: Set up keymaps
		vim.keymap.set("n", "<leader>tt", neotest.run.run, { noremap = true, silent = true, desc = "Run nearest test" })
		vim.keymap.set(
			"n",
			"<leader>ts",
			neotest.run.stop,
			{ noremap = true, silent = true, desc = "Stop current test" }
		)
		vim.keymap.set(
			"n",
			"<leader>ta",
			neotest.run.attach,
			{ noremap = true, silent = true, desc = "Attach to current test" }
		)
		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { noremap = true, silent = true, desc = "Run current file tests" })
		vim.keymap.set(
			"n",
			"<leader>to",
			neotest.output.open,
			{ noremap = true, silent = true, desc = "Open test output" }
		)
		vim.keymap.set(
			"n",
			"<leader>tp",
			neotest.output_panel.toggle,
			{ noremap = true, silent = true, desc = "Toggle output panel" }
		)
		vim.keymap.set(
			"n",
			"<leader>ts",
			neotest.summary.toggle,
			{ noremap = true, silent = true, desc = "Toggle test summary" }
		)
	end,
}
