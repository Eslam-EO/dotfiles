local status, tokyonight = pcall(require, "tokyonight")
if not status then
	return
end

tokyonight.setup({
	style = "moon",
	transparent = true,
	lualine_bold = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})

vim.cmd("colorscheme tokyonight")

-- local status, onedark = pcall(require, "onedarkpro")
-- if not status then
-- 	return
-- end
--
-- onedark.setup({
-- 	options = {
-- 		transparency = true,
-- 		cursorline = true,
-- 	},
-- })
--
-- vim.cmd("colorscheme onedark_vivid")
