local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
	ls.add_snippets("java", {
		ls.snippet(
			"main",
			fmt(
				[[
        public class {} {{
          public static void main(String[] args) {{
            {}
          }}
        }}
      ]],
				{
					ls.insert_node(1),
					ls.insert_node(2),
				}
			)
		),
		ls.snippet(
			"sout",
			fmt(
				[[
      System.out.println({});
    ]],
				{
					ls.insert_node(1),
				}
			)
		),
	}),
}
