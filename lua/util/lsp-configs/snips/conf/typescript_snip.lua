local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
	ls.add_snippets("typescript", {
		ls.snippet(
			"log",
			fmt(
				[[
      console.log({})
    ]],
				{
					ls.insert_node(1),
				}
			)
		),
	}),
}
