return {
	"AbhiShake1/rengoku.nvim",
	config = function()
		require("rengoku").setup({
			transparent_mode = true,
			palette_overrides = {
				dark4 = "#ffffff"
			}
		})
	end,
}
