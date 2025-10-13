# targets that aren't filenames
.PHONY: all clean deploy

all:
	jekyll build

clean:
	$(RM) -r _site

HOST := irene@geoduck.ambulatoryclam.net

deploy: clean all
	rsync --compress --recursive --checksum --itemize-changes --delete -e ssh _site/ $(HOST):/zebra/www/rootstock/
