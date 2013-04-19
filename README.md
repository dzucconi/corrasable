# Corrasable

Is an API that packages together tools like [Lingua](http://www.pressure.to/ruby/) and [The CMU Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict) to assist in analyzing text and converting it into different representations.

```bash
heroku create
heroku addons:add mongolab:starter
git push heroku master
rake dictionary:generate # todo
```

----

### Report

```bash
curl -d 'text=Language operates between literal and metaphorical signification.'  http://api.corrasable.com/
```

```json
{
  "num_paragraphs": 1,
  "num_sentences": 1,
  "num_chars": 65,
  "num_characters": 65,
  "num_words": 7,
  "num_syllables": 22,
  "num_unique_words": 7,
  "words_per_sentence": 7.0,
  "syllables_per_word": 3.142857142857143,
  "kincaid": 24.22571428571429,
  "flesch": -66.15571428571423,
  "fog": 25.65714285714286,
  "percent_fog_complex_words": 57.14285714285714,
  "text": "Language operates between literal and metaphorical signification.",
  "paragraphs": [
      "Language operates between literal and metaphorical signification."
    ],
  "sentences": [
      "Language operates between literal and metaphorical signification."
    ],
  "words": [
      "Language",
      "operates",
      "between",
      "literal",
      "and",
      "metaphorical",
      "signification"
    ],
  "unique_words": [
      "Language",
      "operates",
      "between",
      "literal",
      "and",
      "metaphorical",
      "signification"
    ],
  "frequencies": {
    "Language": 1,
    "operates": 1,
    "between": 1,
    "literal": 1,
    "and": 1,
    "metaphorical": 1,
    "signification": 1
  }
}
```

### Phonemes

```bash
curl -d $'text=Where words are scarce, they are seldom spent in vain,\nFor they breathe truth that breathe their words in pain'  http://api.corrasable.com/phonemes
```

```json
[
  [
    "W EH1 R",
    "W ER1 D Z",
    "AA1 R",
    "S K EH1 R S",
    ",",
    "DH EY1",
    "AA1 R",
    "S EH1 L D AH0 M",
    "S P EH1 N T",
    "IH0 N",
    "V EY1 N",
    ","
  ],
  [
    "F AO1 R",
    "DH EY1",
    "B R IY1 DH",
    "T R UW1 TH",
    "DH AE1 T",
    "B R IY1 DH",
    "DH EH1 R",
    "W ER1 D Z",
    "IH0 N",
    "P EY1 N"
  ]
]
```

### Word

```
curl http://api.corrasable.com/words/difficult
```

```json
{
  "word": "DIFFICULT",
  "phonemes": ["D", "IH1", "F", "AH0", "K", "AH0", "L", "T"],
  "syllables": 3,
  "language": "en"
}
```
