install:
	cp ./stack-fpm /usr/local/bin/stack-fpm
	chmod +x /usr/local/bin/stack-fpm

uninstall:
	rm /usr/local/bin/stack-fpm

push:
	git remote -v | awk '{ print $1 }' | sort | uniq | xargs -I% git push % master 
