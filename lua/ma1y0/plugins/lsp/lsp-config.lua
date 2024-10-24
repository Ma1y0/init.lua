return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "j-hui/fidget.nvim", opts = {} }, -- Lsp notifications
	},

	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

				vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Go to definition" })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0, desc = "Go to references" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Go to definition" })
				vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0, desc = "Go to type definition" })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
				vim.keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ desc = "Show buffer diagnostics" }
				)

				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = 0, desc = "Lsp rename" })
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0, desc = "Lsp code actions" })
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart lsp" })
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Rust and Haskell are configured in separate files

		-- Lua lsp
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- Zig lsp
		lspconfig.zls.setup({
			capabilities = capabilities,
		})

		-- Java lsp
		lspconfig.jdtls.setup({
			capabilities = capabilities,
			handlers = {
				-- By assigning an empty function, you can remove the notifications
				-- printed to the cmd
				["$/progress"] = function(_, result, ctx) end,
			},
		})

		-- CSS lsp
		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		-- TS/JS lsp
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("package.json"),
		})
		--
		-- lspconfig.denols.setup({
		-- 	capabilities = capabilities,
		-- 	root_dir = lspconfig.util.root_pattern("deno.json"),
		-- })

		lspconfig.eslint.setup({
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("package.json"),
		})

		-- Tailwind lsp
		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		-- C lsp
		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		-- Go lsp
		lspconfig.gopls.setup({
			capabilities = capabilities,
		})

		-- Elixir lsp
		lspconfig.elixirls.setup({
			capabilities = capabilities,
			cmd = { "/home/ma1y0/.local/share/nvim/mason/bin/elixir-ls" },
		})

		-- Python lsp
		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		-- Docker lsp
		lspconfig.docker_compose_language_service.setup({
			capabilities = capabilities,
		})

		lspconfig.dockerls.setup({
			capabilities = capabilities,
		})

		-- Assembly
		lspconfig.asm_lsp.setup({
			capabilities = capabilities,
		})

		-- Kotlin
		lspconfig.kotlin_language_server.setup({
			capabilities = capabilities,
		})
	end,
}
