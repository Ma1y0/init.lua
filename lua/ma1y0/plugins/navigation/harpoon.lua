return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add file to harpoon" })

		vim.keymap.set("n", "<C-a>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Show list of harpoon files" })

		for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
			vim.keymap.set("n", string.format("<space>%d", idx), function()
				harpoon:list():select(idx)
			end, { desc = string.format("Harpoon file %d", idx) })
		end
	end,
}
