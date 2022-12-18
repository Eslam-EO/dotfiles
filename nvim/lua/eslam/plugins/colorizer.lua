local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

colorizer.setup({
	"*",
	css = { css = true },
	html = { names = false },
})
