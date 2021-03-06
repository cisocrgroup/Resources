# Lexica
This directory contains lexical resources for the language-aware OCR document error profiler together with a Makefile to build the necessary binaries. See the [Profiler Manual][profman] for a description.

Currently, we serve lexica for classical Latin, German (both modern and historical) and Ancient Greek.

Further historical lexica for other languages may be obtained from the repository of the IMPACT Centre of Competence at <http://www.digitisation.eu/tools-resources/language-resources/>.

[profman]: https://github.com/cisocrgroup/Resources/blob/master/manuals/profiler-manual.md

# Structure
All language resources reside in `lex/language-name`.

# Building
Use the Makefile to build the profiler's language resources.  In order
for the makefile to work, the executables `compileFBDic`,
`trainFrequencyList` and `runDictSearch` from the profiler have to be
visible in your environment's path (you can set the paths using the
`COMPILE`, `TRAIN` and `SEARCH` environment variables respectively).

# Installing
You can install the language files using the makefile's `install`
target.  The language files are installed to `/etc/profiler/languages`
(you can change the destination using the `DESTDIR` environment
variable).

# References
## Historical German

The lexica for historical German have been compiled at CIS during the IMPACT (2008-2012) project. The corresponding research is described in the following references:

Gotscharek, Annette, Andreas Neumann, Ulrich Reffle, Christoph Ringlstetter, and Klaus U. Schulz. "Enabling information retrieval on historical document collections: The role of matching procedures and special lexica." In Proceedings of The Third Workshop on Analytics for Noisy Unstructured Text Data, pp. 69-76. ACM, 2009.

Gotscharek, Annette, Andreas Neumann, Ulrich Reffle, Christoph Ringlstetter, and K. Schulz. "Constructing a Lexicon from a Historical Corpus." In Proc. Conference of the American Association for Corpus Linguistics (AACL09). 2009.

Gotscharek, Annette. Lexikalische Ressourcen zur Erschließung historischer Dokumentkollektionen. Verlag Dr. Hut, 2010.

Gotscharek, Annette, Ulrich Reffle, Christoph Ringlstetter, Klaus U. Schulz, and Andreas Neumann. "Towards information retrieval on historical document collections: The role of matching procedures and special lexica." International Journal on Document Analysis and Recognition (IJDAR) 14, no. 2 (2011): 159-171.

## Modern German
Lexica for modern German have been constructed via the hunspell `unmunch` command (for the procedure see the [profiler manual][profman]) from the LibreOffice spellchecking lexica by Karl Zeiler, both in [modern spelling][modspell] and [old 1901 spelling][oldspell] versions.

[modspell]: http://extensions.libreoffice.org/extension-center/german-de-de-frami-dictionaries
[oldspell]: http://extensions.libreoffice.org/extension-center/german-de-de-1901-old-spelling-dictionaries

## Latin
The current Latin lexicon has been constructed by "unmunching" (for the procedure see the [profiler manual][profman]) the [LibreOffice spellchecking Latin lexicon provided by Karl Zeiler][zeilatin] by taking his "classical lexicon" and taking out all wordforms where u has been replaced by v, both from the .dic-file and the .aff-file rules (this reduplication of wordforms is unnecessary as we have the historical rewrite rules u:v, v:u in our pattern list). Furthermore, all replacement rules for constructing spelling variants were taken out of the .aff-file. Thereby the number of entries in la.dic (lemmata and those inflections needed for constructing full paradigms) was reduced from 129.290 to 84.882, the number of suffix rules from 11.136 to 7.776 and the number of wordforms in the final lexicon (each 4 times, naked plus attached with the enclitics -que, -ne, -ve) from an artificially inflated 20 million to 8.4 million. Discounting the enclitic forms, this corresponds to 2.1 million word forms of classical Latin contained in this lexicon.

[zeilatin]: http://extensions.libreoffice.org/extension-center/latin-spelling-and-hyphenation-dictionaries
[profman]: https://github.com/cisocrgroup/Resources/blob/master/manuals/profiler-manual.md

The work at CIS on the larger, 70k classical lemmata containing Berlin Latin Lexicon (BLL) will soon be made available here as well. See its description in:

Springmann, Uwe, Dietmar Najock, Hermann Morgenroth, Helmut Schmid, Annette Gotscharek, and Florian Fink. "OCR of historical printings of Latin texts: problems, prospects, progress." In Proceedings of the First International Conference on Digital Access to Textual Cultural Heritage, pp. 71-75. ACM, 2014.

## Ancient Greek
The Ancient Greek lexicon stems from a tokenized list of Greek wordforms from the [Perseus Project][perseus].

[perseus]: http://www.perseus.tufts.edu/hopper/opensource/download
