.POSIX:
VERSION   = 3.9
FETCH_URL = http://distfiles.audacious-media-player.org

audacious-$(VERSION)-installer.exe: audacious-$(VERSION)/ audacious.nsi
	makensis -DVERSION=$(VERSION) audacious.nsi

audacious-$(VERSION)/: audacious-$(VERSION)-win32.zip
	unzip -o -d $@ audacious-$(VERSION)-win32.zip

audacious-$(VERSION)-win32.zip:
	curl -LO $(FETCH_URL)/audacious-$(VERSION)-win32.zip

clean:
	rm -rf audacious-$(VERSION) audacious-$(VERSION)-installer.exe

distclean: clean
	rm -f audacious-$(VERSION)-win32.zip
