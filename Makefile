install:
	cp ./stack-fpm /usr/local/bin/stack-fpm
	chmod +x /usr/local/bin/stack-fpm

uninstall:
	rm /usr/local/bin/stack-fpm

push:
	git push gitlab master
	git push origin master
