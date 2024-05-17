local set = vim.opt_local

vim.api.nvim_create_augroup("custom-term-open", {})

vim.api.nvim_create_autocmd("TermOpen", {
	group = "custom-term-open",
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
		vim.opt_local.spell = false -- Disable spell checking
		vim.cmd("startinsert") -- Starts in insert mode
	end,
})

-- Auto insert mode in terminal
vim.api.nvim_create_autocmd("BufEnter", {
	group = "custom-term-open",
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

-- Opens terminal at the bottom
vim.keymap.set("n", "<leader>tb", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 12)
	vim.wo.winfixheight = true
	vim.cmd.term()
end, { desc = "Opens new terminal at the bottom" })

-- Opens terminal at the right side
vim.keymap.set("n", "<leader>tr", function()
	vim.cmd.vnew() -- Open a new vertical split
	vim.cmd.wincmd("l") -- Move cursor to the new split
	vim.api.nvim_win_set_width(0, 40) -- Set the width of the new split
	vim.wo.winfixwidth = true -- Fix the width of the new split
	vim.cmd.term()
end, { desc = "Opens new terminal on the right" })
