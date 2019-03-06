if [  -e /bin/plasmashell ]; then
	cp -r /home/doc/.atm_kde/* /home/doc/.atom/
	exec startkde
elif [ -e /bin/gnome-shell ]; then
	cp -r /home/doc/.atm_ubuntu/* /home/doc/.atom/
	exec gnome-session
elif [ -e /bin/xfwm4 ]; then
	exec startxfce4
elif [ -e /bin/marco ]; then
	exec mate-session
elif [ -e /usr/lib/libmuffin.so ]; then
	exec cinnamon-session
elif [ -e /bin/budgie-desktop ]; then
	export XDG_CURRENT_DESKTOP=Budgie:GNOME
	exec budgie-desktop
elif [ -e /bin/deepin-session ]; then
	exec startdde
elif [ -e /bin/way-cooler ]; then
	exec way-cooler
fi
