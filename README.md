# V Lang Test Suite

Parser (and code generator mayde :)) tester for CENG444 Term Project #1 - V Language (by Cem Bozşahin).

## Usage

To test your parser's functionality, just run `compile.sh` with your grammar file as an argument.

```bash
git clone https://github.com/ozansz/v-lang-tester
cd v-lang-tester
chmod +x *.sh
./compile.sh /home/sazak/ceng444/V.g4
```

The script then compiles your grammar and runs tests through 6 sample V programs. 

## Extras

The files which name is starting with `ext_` are there to test functionality of custom extensions written by me. These are 

* Multi-dimensional vectors
* Inline assembly

If your grammar gives error in these files, do not care.