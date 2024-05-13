return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6", -- or                              , branch = '0.1.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Faster backend
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
		{ "nvim-telescope/telescope-smart-history.nvim" },
		{ "kkharji/sqlite.lua" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = { ["q"] = require("telescope.actions").close },
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						--			prompt_position = "top",
						preview_width = 0.40,
						results_width = 0.6,
					},
					vertical = {
						mirror = false,
					},
					width = 0.75,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_ignore_patterns = { "node_modules" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				-- Developer configurations: Not meant for general override
				history = {
					path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
					limit = 100,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("smart_history")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		-- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string with grep" })
		-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end,
}
