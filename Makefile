all:
	git submodule update --init --checkout
	cp buildroot.config buildroot/.config
	make -C buildroot
