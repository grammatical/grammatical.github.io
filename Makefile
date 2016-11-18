
all: build

build:
	jekyll build

run: _bibliography/grammatical.bib
	jekyll server --watch

_bibliography/grammatical.bib: _bibliography/grammatical.dev.bib
	cat $^ | grep -vP "^\s*(url|pdf)\s*=\s*" > $@.tmp
	ruby ./scripts/clean-bibtex.rb -d -u $@.tmp > $@
	rm $@.tmp

clean:
	rm -rf _site _bibliography/grammatical.bib

.PHONY: all build clean run
