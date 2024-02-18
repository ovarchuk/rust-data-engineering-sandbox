install:
	cargo install mdbook
	#install node
	#curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - &&\
	#sudo apt-get install -y nodejs
	#npm install -g @githubnext/github-copilot-cli
	
	echo 'eval "$(github-copilot-cli alias -- "$0")"' >> ~/.bashrc

build:
	mdbook build rust-data-engineering-sandbox

serve:
	mdbook serve -p 8000 -n 127.0.0.1 rust-data-engineering-sandbox 

format:
	@echo "Formatting all projects with cargo"
	./format.sh

lint:
	@echo "Linting all projects with cargo"
	@rustup component add clippy 2> /dev/null
	./lint.sh

test:
	@echo "Testing all projects with cargo"
	./test.sh

check-gpu-linux:
	sudo lshw -C display

linkcheck:
	mdbook test -L rust-data-engineering-sandbox

run:
	cargo run

release:
	cargo build --release


all: format lint test run