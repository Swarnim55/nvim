local Terminal = require("toggleterm.terminal").Terminal

local v_term = Terminal:new({ direction = "vertical" })
local h_term = Terminal:new({ direction = "horizontal" })
local f_term = Terminal:new({ direction = "float" })

function _toggle_v_term() v_term:toggle() end

function _toggle_h_term() h_term:toggle() end

function _toggle_f_term() f_term:toggle() end

-- for normal mode
vim.api.nvim_set_keymap(
	"n",
	"<M-1>",
	"<cmd>lua _toggle_h_term()<cr>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<M-2>",
	"<cmd>lua _toggle_v_term()<cr>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<M-3>",
	"<cmd>lua _toggle_f_term()<cr>",
	{ noremap = true, silent = true }
)

-- for terminal mode
vim.api.nvim_set_keymap(
	"t",
	"<M-1>",
	"<C-\\><C-n><cmd>lua _toggle_h_term()<cr>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"t",
	"<M-2>",
	"<C-\\><C-n><cmd>lua _toggle_v_term()<cr>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
	"t",
	"<M-3>",
	"<C-\\><C-n><cmd>lua _toggle_f_term()<cr>",
	{ noremap = true, silent = true }
)
