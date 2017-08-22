VERSION   = 3.9
FETCH_URL = http://distfiles.audacious-media-player.org

audacious-$(VERSION)-installer.exe: audacious-$(VERSION)-win32.zip
	unzip -o $^
	makensis -DVERSION=$(VERSION) audacious.nsi

audacious-$(VERSION)-win32.zip:
	curl -O $(FETCH_URL)/audacious-$(VERSION)-win32.zip

clean:
	rm -rf bin etc lib share README.txt

distclean: clean
	rm *.zip *.exe
