local M = {}
local status, translator = pcall(require, "translator")

if not status then
	vim.notify("translator is not found ...", vim.log.levels.ERROR, { title = "Nvim" })
	return false
end

function M.Config()
	translator.setup({
		translate_target_lang = "zh",
		translator_deepl_url = "https://fanyi.baidu.com/mtpe-individual/multimodal",
	})

	vim.keymap.set("v", "t", function()
		translator.translate()
	end)
end

return M
