FBDIC ?= compileFBDic
TRAIN ?= trainFrequencyList
DESTDIR ?= /etc/profiler/languages

all: german latin greek
greek: greek/freqlist.binfrq
latin: latin/freqlist.binfrq
german: german/freqlist.binfrq

greek/freqlist.binfrq: greek/patterns.nfc greek/gt.nfc greek/modern.fbdic
	$(TRAIN) --config greek.ini --textFile greek/gt.nfc
latin/freqlist.binfrq: latin/patterns.nfc latin/gt.nfc latin/modern.fbdic
	$(TRAIN) --config latin.ini --textFile latin/gt.nfc
german/freqlist.binfrq: german/patterns.nfc german/gt.nfc german/modern.fbdic
	$(TRAIN) --config german.ini --textFile german/gt.nfc

%.fbdic: %.srt
	LC_ALL=C $(FBDIC) $< $@

latin/modern.txt: latin/xaa latin/xab latin/xac
	cat $< > $@

%.nfc: %.txt
	uconv -f utf8 -t utf8 -x nfc -o $@ $<

%.srt: %.nfc
	cat $< | PERLIO=:utf8 perl -pe '$$_=lc($$_)' | \
		LC_ALL=C sort | LC_ALL=C uniq | sed -e '/^[[:space:]]*$$/d' > $@
clean:
	$(RM) {german,latin,greek}/*.nfc
	$(RM) {german,latin,greek}/*.fbdic
	$(RM) {german,latin,greek}/weights.txt
	$(RM) {german,latin,greek}/corpusLexicon.fbdic
	$(RM) {german,latin,greek}/freqlist.binfrq
	$(RM) latin/modern.txt

install: all
	install -m 0644 -D german/patterns.txt $(DESTDIR)/german/patterns.txt
	install -m 0644 -D german/modern.fbdic $(DESTDIR)/german/modern.fbdic
	install -m 0644 -D german/freqlist.binfrq $(DESTDIR)/german/freqlist.binfrq
	install -m 0644 -D german/weights.txt $(DESTDIR)/german/weights.txt
	install -m 0644 -D latin/patterns.txt $(DESTDIR)/latin/patterns.txt
	install -m 0644 -D latin/modern.fbdic $(DESTDIR)/latin/modern.fbdic
	install -m 0644 -D latin/freqlist.binfrq $(DESTDIR)/latin/freqlist.binfrq
	install -m 0644 -D latin/weights.txt $(DESTDIR)/latin/weights.txt
	install -m 0644 -D greek/patterns.txt $(DESTDIR)/greek/patterns.txt
	install -m 0644 -D greek/modern.fbdic $(DESTDIR)/greek/modern.fbdic
	install -m 0644 -D greek/freqlist.binfrq $(DESTDIR)/greek/freqlist.binfrq
	install -m 0644 -D greek/weights.txt $(DESTDIR)/greek/weights.txt

.PHONY: german latin greek all clean install
