/client/verb/togglerightclickstuff()
	set category = "OOC"
	set name = "Toggle Rightclick"
	set desc = "Did the context menu get stuck on or off? Press this button."

	show_popup_menus = !show_popup_menus
	to_chat(src, span_notice("The right-click context menu is now [show_popup_menus ? "enabled" : "disabled"]."))
