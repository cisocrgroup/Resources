FBDIC ?= $(HOME)/devel/work/profiler/gsm/csl/build/bin/compileFBDic
TRAIN ?= $(HOME)/devel/work/profiler/build/bin/trainFrequencyList

all:
	@echo "Usage: make <language>"
	@exit 1

greek: greek/modern.fbdic greek/freqlist.binfrq
latin: latin/modern.fbdic latin/freqlist.binfrq

greek/freqlist.binfrq: greek/patterns.nfc greek/gt.nfc
	$(TRAIN) --config greek.ini --textFile greek/gt.nfc
latin/freqlist.binfrq: latin/patterns.nfc latin/gt.nfc
	$(TRAIN) --config latin.ini --textFile latin/gt.nfc

%.fbdic: %.srt
	$(FBDIC) $< $@

latin/modern.txt:
	cat latin/xa{a,b,c,d,e,f} > $@

%.nfc: %.txt
	uconv -f utf8 -t utf8 -x nfc -o $@ $<

%.srt: %.nfc
	cat $< | LC_ALL=C sort | LC_ALL=C uniq | sed -e '/^[[:space:]]*$$/d' > $@

.PHONY: latin greek


corpusLexicon = "${:DICT_PATH}/corpusLexicon.fbdic"
patternWeightsFile="${:DICT_PATH}/weights.txt"
freqListFile = "${:DICT_PATH}/freqlist.binfrq"
