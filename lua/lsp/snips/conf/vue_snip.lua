local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("vue", {
	ls.snippet(
		"vue3",
		fmt(
			[[
        <script setup lang="ts">
          {}
        </script>

        <template>
          <div class="{}">{}</div>
        </template>

        <style lang="scss" scoped>
          {}
        </style>
      ]],
			{
				ls.insert_node(1),
				ls.insert_node(2),
				ls.insert_node(3),
				ls.insert_node(4),
			}
		)
	),
	ls.snippet(
		"vue2",
		fmt(
			[[
		<script>
      export default {{
        data(){{
          return {{
            {}
          }}
        }}
      }}
    </script>

    <template>
      <div class="{}">{}</div>
    </template>

    <style lang="scss" scoped>
      {}
    </style>
  ]],
			{
				ls.insert_node(1),
				ls.insert_node(2),
				ls.insert_node(3),
				ls.insert_node(4),
			}
		)
	),
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
})
