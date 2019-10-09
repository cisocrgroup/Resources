FBDIC ?= compileFBDic
TRAIN ?= trainFrequencyList

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

.PHONY: latin greek clean
