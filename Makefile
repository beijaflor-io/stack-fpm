install:
	cp ./stack-fpm /usr/local/bin/stack-fpm
	chmod +x /usr/local/bin/stack-fpm

uninstall:
	rm /usr/local/bin/stack-fpm

push:
	git push gitlab master
	git push origin master

docker:
	docker build -f ./fpm.dockerfile -t beijaflorio/fpm .
	docker build -f ./stack-fpm-ci.dockerfile -t beijaflorio/stack-fpm-ci .
	docker push beijaflorio/fpm
	docker push beijaflorio/stack-fpm-ci
