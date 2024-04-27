return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },

			ensure_installed = { "c", "cpp", "rust", "lua", "python", "javascript", "typescript" },
		})
	end,
}
