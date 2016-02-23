# Description of contents

As illustrative examples for your own experimentation we included some
example documents (about 100 pages each) to be used with both the profiler and PoCoTo.

Many thanks to Kay Würzner (Grenzboten), Federico Boschetti (Zonaras)
and Jasmin Chebib and Haide Friedrich-Salgado (Hobbes) for providing us with ground truth

Each book project folder contains:

* preprocessed page images (binarized  tifs)
* ground truth in gt (incomplete for Hobbes and Zonaras, none for CSEL and Swete)
* OCR output from ABBYY, Tesseract and OCRopus

The script nfc.sh is a simple bash script allowing you to normalize all UTF-8 text files to "[normalization form composed][nfc]". PoCoTo will normalize all input by itself but be aware that different forms of Unicode normalization behave differently under text transformations and that text comparisons (e.g. OCR corrected text and ground truth) are meaningful only if both  texts are equally normalized.

[nfc]: https://en.wikipedia.org/wiki/Unicode_equivalence

Sources for page images (scans):

## German
* Goethe: [Die Wahlverwandtschaften vol. 1][wahlverw], 1809
    * [Text][textwahl] in Deutsches Textarchiv
* [Die Grenzboten][grenzboten], 1841
    * [Text][textgrenz] in DTAQ (registration required)

## Latin
* Hobbes: [Leviathan][leviathan], Latin edition, 1668
* [Corpus scriptorum ecclesiasticorum latinorum (CSEL) vol. 4][csel4], 1875

## Greek
* Zonaras: [Epitome historiarum vol. 3][epitome], 1870
* Swete Septuaginta: [Old Testament in Greek, vol. 1][swete1], 1901

[books]: http://www.cis.lmu.de/ocrworkshop/data/books/books-ocr.zip
[workshop]: http://www.cis.lmu.de/ocrworkshop/
[wahlverw]: http://daten.digitale-sammlungen.de/~db/0008/bsb00087891/images/
[textwahl]: http://www.deutschestextarchiv.de/book/show/goethe_wahlverw01_1809
[textgrenz]: http://www.deutschestextarchiv.de/dtaq/book?q=grenzboten_179382_282158
[grenzboten]: http://brema.suub.uni-bremen.de/periodical/titleinfo/282158
[leviathan]: https://archive.org/details/leviathansivedem00hobb
[epitome]: https://archive.org/details/ioannoutouzonara03zonauoft
[swete1]: https://archive.org/details/oldtestamentingr01swet
[pg82]: http://www.mdz-nbn-resolving.de/urn/resolver.pl?urn=urn:nbn:de:bvb:12-bsb10800809-1
[csel4]: https://archive.org/details/corpusscriptoru09wissgoog
