return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")
		vim.cmd.colorscheme("catppuccin")

		catppuccin.setup({
			integrations = {
				cmp = true,
				nvimtree = true,
				treesitter = true,
				harpoon = true,
				mason = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				which_key = true,
			},
		})
	end,
}
