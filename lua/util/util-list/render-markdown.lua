local M = {}
local status, md_render = pcall(require, "render-markdown")

if not status then
	vim.notify("render-markdown is not found ...")
	return false
end

function M.Config()
	md_render.setup({
		file_types = { "markdown", "codecompanion" },
		heading = {
			position = "inline",
			icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
			backgrounds = {
				"RenderMarkdownH1Bg",
				"RenderMarkdownH2Bg",
				"RenderMarkdownH3Bg",
				"RenderMarkdownH4Bg",
				"RenderMarkdownH5Bg",
				"RenderMarkdownH6Bg",
			},
			foregrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
			},
		},
		quote = {
			highlight = "DiffAdd",
		},
		dash = { icon = "" },
		code = {
			above = "",
			below = "",
			highlight = "",
			highlight_inline = "",
		},
		pipe_table = {
			preset = "round",
			row = "@markup.row",
		},
	})
end

return M
