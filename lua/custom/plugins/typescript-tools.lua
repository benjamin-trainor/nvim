return {
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("typescript-tools").setup({
				root_dir = require("lspconfig").util.root_pattern(".git", "package.json"),
				on_attach = function(client, bufnr)
					local opts = { silent = true }
					vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"gs",
						":sp <CR><cmd>lua vim.lsp.buf.definition()<CR><C-W>T",
						opts
					)
					vim.api.nvim_buf_set_keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<leader>e",
						':lua vim.diagnostic.open_float({scope="line"})<CR>',
						opts
					)

					client.server_capabilities.diagnostics = false
				end,
				tsserver_plugins = {
					-- for TypeScript v4.9+
					"@styled/typescript-styled-plugin",
					-- or for older TypeScript versions
					-- "typescript-styled-plugin",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					require("none-ls.diagnostics.eslint_d"),
					require("none-ls.code_actions.eslint_d"),
				},
			})
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
		end,
	},
	{
		"b3nj5m1n/kommentary",
		config = function()
			require("kommentary.config").configure_language("default", {
				single_line_comment_string = "auto",
				multi_line_comment_strings = "auto",
				hook_function = function()
					require("ts_context_commentstring").update_commentstring()
				end,
			})
		end,
	},
}
