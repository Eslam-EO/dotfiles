local status, onedark = pcall(require, "onedarkpro")
if not status then
	return
end

onedark.setup({
	options = {
		transparency = true,
		cursorline = true,
	},
})

vim.cmd("colorscheme onedark_vivid")
