VERSION = 3.7.2
FETCH_URL = http://distfiles.audacious-media-player.org

audacious-$(VERSION)-installer.exe : audacious-$(VERSION)-win32.zip
	unzip -o $^
	makensis -DVERSION=$(VERSION) audacious.nsi

audacious-$(VERSION)-win32.zip :
	curl -O $(FETCH_URL)/audacious-$(VERSION)-win32.zip

.PHONY : clean dist-clean

clean :
	rm -rf bin etc lib share README.txt

dist-clean : clean
	rm *.zip *.exe
