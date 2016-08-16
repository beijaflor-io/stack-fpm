from haskell:8
run apt-get update
run apt-get install -y libruby rubygems
run apt-get install -y ruby-dev
run gem install fpm
add . /stack-fpm
workdir /stack-fpm
run stack install --install-ghc
