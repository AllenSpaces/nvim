local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- ts
	ls.add_snippets("typescriptreact", {
		ls.snippet(
			--
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
		--
		ls.snippet(
			"rfc",
			fmt(
				[[
      import React from "react"

      export default function {}() {{
        return <div className="{}">{}</div>
      }}
    ]],
				{
					ls.insert_node(1),
					rep(1),
					ls.insert_node(2),
				}
			)
		),
		--
	}),
	-- js
	ls.add_snippets("javascriptreact", {
		--
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
		--
		ls.snippet(
			"rfc",
			fmt(
				[[
      import React from "react"

      export default function {}() {{
        return <div className="{}">{}</div>
      }}
    ]],
				{
					ls.insert_node(1),
					rep(1),
					ls.insert_node(2),
				}
			)
		),
		--
	}),
}
