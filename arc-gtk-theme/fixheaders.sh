#!/bin/sh

desc=$(grep '# Description' Pkgfile | cut -d : -f2- | xargs)
url=$(grep '# URL' Pkgfile | cut -d : -f2- | xargs)
maint=$(grep '# Maintainer' Pkgfile | cut -d : -f2- | xargs)
deps=$(grep '# Depends' Pkgfile | cut -d : -f2- | xargs)

sed -e "s/# Description.*/# Description:	$desc/" \
	-e "s,# URL.*,# URL:		$url," \
	-e "s/# Maintainer.*/# Maintainer:	$maint/" \
	-e "s/# Depends.*/# Depends on:	$deps/" \
Pkgfile
