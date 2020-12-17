sudo dpkg --get-selections | sed "s/.*deinstall//" | sed "s/install$//g" > pkglist
# apt list --installed > pkglist

