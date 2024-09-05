local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	ls.add_snippets("lua", {
		ls.snippet(
			"pr",
			fmt(
				[[
      local status, {} = pcall(require, "{}")

      if not status then
        vim.notify("{} is not found ...")
        return false
      end
    ]],
				{
					ls.insert_node(1),
					ls.insert_node(2),
					rep(2),
				}
			)
		),
		ls.snippet(
			"use",
			fmt(
				[[
        use({{
          "{}"
        }})
      ]],
				{
					ls.insert_node(1),
				}
			)
		),
	}),
}
