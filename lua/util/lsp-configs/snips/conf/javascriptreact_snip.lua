local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
	ls.add_snippets("javascriptreact", {
		ls.snippet(
			"rnc",
			fmt(
				[[
        import {{ View }} from "react-native" 

        function {}() {{
          return <View></View>
        }}

        export default {}
      ]],
				{
					ls.insert_node(1),
					rep(1),
				}
			)
		),
		ls.snippet(
			"rncs",
			fmt(
				[[
        import React from 'react'
        import {{ View }} from "react-native" 

        const {}: React.FC = () => {{
          return <View></View>
        }}

        {}.displayName = "{}"

        export default {}
      ]],
				{
					ls.insert_node(1),
					rep(1),
					rep(1),
					rep(1),
				}
			)
		),
		ls.snippet(
			"rfc",
			fmt(
				[[
        import React from 'react'

        function {}() {{
          return <div className={}>{}</div>
        }}
      ]],
				{
					ls.insert_node(1),
					rep(1),
					ls.insert_node(2),
				}
			)
		),
	}),
}
