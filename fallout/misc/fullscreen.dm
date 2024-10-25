/client
	var/is_fullscreen = 0

//for the client to optionally go fullscreen
/client/verb/toggle_fullscreenwindow()
	set category = "Preferences"
	set name = "Toggle Fullscreen"

	src.is_fullscreen = !src.is_fullscreen

	if(src.is_fullscreen)
		winset(src, "mainwindow", "is-maximized=false;can-resize=false;titlebar=false;menu=menu")
		winset(src, "mainwindow.mainvsplit", "pos=0x0")
	else
		winset(src, "mainwindow", "is-maximized=false;can-resize=true;titlebar=true;menu=menu")
		winset(src, "mainwindow.mainvsplit", "pos=3x0")
	winset(src, "mainwindow", "is-maximized=true")
