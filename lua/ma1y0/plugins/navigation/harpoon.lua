return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local ui = require("harpoon.ui")
		local mark = require("harpoon.mark")
		local keymap = vim.keymap

		keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
		keymap.set("n", "<C-a>", ui.toggle_quick_menu, { desc = "Show list of harpoon files" })

		keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end)
		keymap.set("n", "<C-j>", function()
			ui.nav_file(2)
		end)
		keymap.set("n", "<C-k>", function()
			ui.nav_file(3)
		end)
		keymap.set("n", "<C-l>", function()
			ui.nav_file(4)
		end)
	end,
}
