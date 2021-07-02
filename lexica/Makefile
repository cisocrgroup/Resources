SEARCH ?= runDictSearch
COMPILE ?= compileFBDic
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
	$(COMPILE) $< $@

latin/modern.txt: latin/xaa latin/xab latin/xac
	cat $^ > $@

german/modern.txt: german/oo.txt german/verben.tmp.txt german/nomen.tmp.txt german/adjektive.tmp.txt
	cat $^ > $@

%.tmp.txt: %.sql.gz
	zcat $< | sed -e 's/),/\n/g' | sed -e 's#/\*.*\*/##g' | sed -e 's/(//g' | awk -F',' '{print $$2}' | tr -d "'" | tr '[:upper:]' '[:lower:]' > $@

%.sql.gz:
	wget -q -O - "http://www.korrekturen.de/flexion/download/${shell basename $@}" > $@

german/verben.txt :german/nomen.txt german/adjektive.txt

%.nfc: %.txt
	uconv -f utf8 -t utf8 -x nfc -o $@ $<

%.srt: %.nfc
	cat $< | PERLIO=:utf8 perl -pe '$$_=lc($$_)' | \
		LC_ALL=C sort | LC_ALL=C uniq | sed -e '/^[[:space:]]*$$/d' > $@
clean:
	$(RM) german/*.nfc
	$(RM) german/*.fbdic
	$(RM) german/*.binfrq
	$(RM) german/*.srt
	$(RM) german/*.tmp.txt
	$(RM) german/*.sql.gz
	$(RM) german/weights.txt
	$(RM) latin/*.nfc
	$(RM) latin/*.fbdic
	$(RM) latin/*.binfrq
	$(RM) latin/*.srt
	$(RM) latin/weights.txt
	$(RM) latin/modern.txt
	$(RM) greek/*.nfc
	$(RM) greek/*.fbdic
	$(RM) greek/*.binfrq
	$(RM) greek/*.srt
	$(RM) greek/weights.txt

install: all
# german language files
	install -m 0644 -D german.ini $(DESTDIR)/german.ini
	install -m 0644 -D german/patterns.txt $(DESTDIR)/german/patterns.txt
	install -m 0644 -D german/modern.fbdic $(DESTDIR)/german/modern.fbdic
	install -m 0644 -D german/freqlist.binfrq $(DESTDIR)/german/freqlist.binfrq
	install -m 0644 -D german/weights.txt $(DESTDIR)/german/weights.txt
# latin language files
	install -m 0644 -D latin.ini $(DESTDIR)/latin.ini
	install -m 0644 -D latin/patterns.txt $(DESTDIR)/latin/patterns.txt
	install -m 0644 -D latin/modern.fbdic $(DESTDIR)/latin/modern.fbdic
	install -m 0644 -D latin/freqlist.binfrq $(DESTDIR)/latin/freqlist.binfrq
	install -m 0644 -D latin/weights.txt $(DESTDIR)/latin/weights.txt
	install -m 0644 -D greek.ini $(DESTDIR)/greek.ini
# greek language files
	install -m 0644 -D greek/patterns.txt $(DESTDIR)/greek/patterns.txt
	install -m 0644 -D greek/modern.fbdic $(DESTDIR)/greek/modern.fbdic
	install -m 0644 -D greek/freqlist.binfrq $(DESTDIR)/greek/freqlist.binfrq
	install -m 0644 -D greek/weights.txt $(DESTDIR)/greek/weights.txt

test: all
# german tests
	$(SEARCH) --config german.ini --query äbte 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config german.ini --query aachen 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config german.ini --query herr 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config german.ini --query üppigstes 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config german.ini --query foobar 2>/dev/null | grep -v dict_modern_exact > /dev/null
# latin tests
	$(SEARCH) --config latin.ini --query aque 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config latin.ini --query imadidisque 2>/dev/null | grep -v dict_modern_exact > /dev/null
	$(SEARCH) --config latin.ini --query sustollarisque 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config latin.ini --query zythve 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config latin.ini --query foobar 2>/dev/null | grep -v dict_modern_exact > /dev/null
# greek tests
# βάδιζε must be encoded as nfc
	$(SEARCH) --config greek.ini --query βάδιζε 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config greek.ini --query καμνα 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config greek.ini --query ζωοποιη 2>/dev/null | grep dict_modern_exact > /dev/null
	$(SEARCH) --config greek.ini --query foobar 2>/dev/null | grep -v dict_modern_exact > /dev/null

.PHONY: german latin greek all clean install test
