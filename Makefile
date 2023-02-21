##
# Project Title
#
# @file
# @version 0.1
CC=clang
CFLAGS=-flto=thin -static

sinit: sinit.c
	$(CC) $(CFLAGS) ./sinit.c -o sinit

install: rc.boot.el rc.shutdown.el sinit
	install -d /lib/init
	install ./rc.boot.el /lib/init/rc.boot.el
	install ./rc.shutdown.el /lib/init/rc.shutdown.el
	install ./sinit /usr/bin/sinit

clean:
	rm sinit
uninstall:
	rm -rvf /lib/init
	rm /usr/bin/init
all: sinit install
# end
