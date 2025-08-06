local map = function(mode, lhs, rhs, opts)
	opts = vim.tbl_extend("keep", opts, { silent = true, buffer = true })
	vim.keymap.set(mode, lhs, rhs, opts)
end

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	if client.config.flags then
		client.config.flags.allow_incremental_sync = true
		client.config.flags.debounce_text_changes  = 100
	end

	map("n", "<leader>lt", "<cmd>lua require'lsp.diag'.toggle()<CR>",
		{ desc = "toggle virtual text [LSP]" })

	-- neovim PR #16057
	-- https://github.com/neovim/neovim/pull/16057
	local winopts = "{ float =  { border = 'rounded' } }"
	map("n", "[d", ("<cmd>lua vim.diagnostic.goto_prev(%s)<CR>"):format(winopts),
		{ desc = "previous diagnostic [LSP]" })
	map("n", "]d", ("<cmd>lua vim.diagnostic.goto_next(%s)<CR>"):format(winopts),
		{ desc = "next diagnostic [LSP]" })
	map("n", "<leader>lc", "<cmd>lua vim.diagnostic.reset()<CR>",
		{ desc = "clear diagnostics [LSP]" })
	map("n", "<leader>l?",
		[[<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded" })<CR>]],
		{ desc = "show line diagnostic [LSP]" })
	map("n", "<leader>lq", "<cmd>lua vim.diagnostic.setqflist()<CR>",
		{ desc = "send diagnostics to quickfix [LSP]" })
	map("n", "<leader>lQ", "<cmd>lua vim.diagnostic.setloclist()<CR>",
		{ desc = "send diagnostics to loclist [LSP]" })

	-- if client_has_capability(client, "codeLensProvider") then
	--   map("n", "<leader>lL", "<cmd>lua vim.lsp.codelens.run()<CR>",
	--     { desc = "[LSP] code lens" })
	--   vim.api.nvim_command
	--     [[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
	-- end
end

return { on_attach = on_attach }
