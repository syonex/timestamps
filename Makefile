DESTDIR	= /usr/local

DESTBIN	= $(DESTDIR)/bin
DESTMAN	= $(DESTDIR)/share/man/man1

all:
	echo Nothing to make, just install

install:
	mkdir -p $(DESTBIN) $(DESTMAN)
	install -c -m 755 src/timestamp $(DESTBIN)/timestamp
	install -c -m 644 src/timestamp.1 $(DESTMAN)/timestamp.1

deb:
	./makepkg deb

rpm:
	./makepkg rpm

clean:
	echo Nothing to clean, just install
