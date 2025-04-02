local M = {}
local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

M.LspMapping = {
	["<Tab>"] = cmp.mapping(function(callback)
		if cmp.visible() then
			cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			callback()
		end
	end, { "i", "s" }),
	["<S-Tab>"] = cmp.mapping(function(callback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			callback()
		end
	end, { "i", "s" }),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
}

M.LspWindow = {
	completion = cmp.config.window.bordered({
		scrollbar = false,
	}),

	documentation = cmp.config.window.bordered({
		scrollbar = false,
	}),

	hover = cmp.config.window.bordered({
		scrollbar = false,
	}),
}

M.LspSource = {
	default = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "lua_cmp" },
	},
	cmdline = {
		search = {
			{ name = "buffer" },
		},
		comamnd = {
			{ name = "path" },
			{ name = "cmdline" },
		},
	},
}

M.LspFormat = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
		vim_item.kind =
			string.format("%s %s", require("util.lsp-configs.kinds.kinds").Kinds[vim_item.kind], vim_item.kind .. "  ")
		vim_item.menu = ({
			luasnip = "   󰬚",
			nvim_lsp = "   󰬓",
			buffer = "   󰬉",
			path = "   󰬗",
			lua_cmp = "   󰬊",
			cmdline = "   ",
		})[entry.source.name]
		return vim_item
	end,
}

return M
