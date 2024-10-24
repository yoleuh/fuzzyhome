tag app-links

	get tips
		let result = []
		let temp

		temp = {
			click_handler: api.handle_click_link.bind(api)
			hotkey_handler: api.handle_click_link.bind(api)
			hotkey: 'return'
			hotkey_display_name: 'Return'
		}
		temp.content = api.selected_link.bang? ? "Use Bang" : "Navigate To Link"
		result.push temp

		temp = {
				click_handler: api.handle_cut.bind(api)
		}
		if api.math_result
			temp.hotkey_display_name = "Cut Math"
			temp.content = "Cut Math Result"
		else
			temp.hotkey_display_name = "Cut"
			temp.content = "Cut All Text"
		result.push temp

		temp = {
				click_handler: api.increment_link_selection_index.bind(api)
				hotkey_handler: api.increment_link_selection_index.bind(api)
				hotkey: 'down|ctrl+n'
				hotkey_display_name: "Down Arrow / <C-n>"
				content: "Move Selection Down"
		}
		result.push temp

		temp = {
				click_handler: api.decrement_link_selection_index.bind(api)
				hotkey_handler: api.decrement_link_selection_index.bind(api)
				hotkey: 'up|ctrl+p'
				hotkey_display_name: "Up Arrow / <C-p>"
				content: "Move Selection Up"
		}
		result.push temp

		result

	<self>
		css w:100% d:flex fld:column gap:15px ofy:hidden max-height:100%

		<app-tips$tips tips=tips>

		<.links>
			css ofy:auto
			for link, index in state.sorted_links
				<app-link link=link index=index key=link>
