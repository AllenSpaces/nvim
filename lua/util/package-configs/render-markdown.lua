local M = {}
local status, md_render = pcall(require, "render-markdown")

if not status then
	M.Config = function()
		vim.notify("render-markdown is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	end
	return false
end

function M.Config()
	md_render.setup({
		file_types = { "markdown", "codecompanion" },
		bullet = {
			highlight = "RenderMarkdownH2",
			icons = { "●", "○", "◆", "◇" },
		},
		heading = {
			position = "inline",
			icons = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " },
			backgrounds = {
				"RenderMarkdownH1",
				"RenderMarkdownH2",
				"RenderMarkdownH3",
				"RenderMarkdownH4",
				"RenderMarkdownH5",
				"RenderMarkdownH6",
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
			highlight = "RenderMarkdownH2",
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
