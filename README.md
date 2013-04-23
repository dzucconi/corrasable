# Corrasable

https://github.com/dzucconi/corrasable

*Corrasable* an API that packages together tools like [Lingua](http://www.pressure.to/ruby/) and [The CMU Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict) to assist in analyzing text and converting it into alternate representations.

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

### NATO Phonetic Alphabet

```bash
curl -d $'text=Where words are scarce, they are seldom spent in vain,\nFor they breathe truth that breathe their words in pain'  http://api.corrasable.com/nato
```

```json
[
  [
    ["Whiskey", "Hotel", "Echo", "Romeo", "Echo"],
    ["Whiskey", "Oscar", "Romeo", "Delta", "Sierra"],
    ["Alfa", "Romeo", "Echo"],
    ["Sierra", "Charlie", "Alfa", "Romeo", "Charlie", "Echo"],
    [","],
    ["Tango", "Hotel", "Echo", "Yankee"],
    ["Alfa", "Romeo", "Echo"],
    ["Sierra", "Echo", "Lima", "Delta", "Oscar", "Mike"],
    ["Sierra", "Papa", "Echo", "November", "Tango"],
    ["India", "November"],
    ["Victor", "Alfa", "India", "November"],
    [","]
  ],
  [
    ["Foxtrot", "Oscar", "Romeo"],
    ["Tango", "Hotel", "Echo", "Yankee"],
    ["Bravo", "Romeo", "Echo", "Alfa", "Tango", "Hotel", "Echo"],
    ["Tango", "Romeo", "Uniform", "Tango", "Hotel"],
    ["Tango", "Hotel", "Alfa", "Tango"],
    ["Bravo", "Romeo", "Echo", "Alfa", "Tango", "Hotel", "Echo"],
    ["Tango", "Hotel", "Echo", "India", "Romeo"],
    ["Whiskey", "Oscar", "Romeo", "Delta", "Sierra"],
    ["India", "November"],
    ["Papa", "Alfa", "India", "November"]
  ]
]
```

### Syllable Counts

```bash
curl -d 'text=My sense of language is that it is matter and not ideas - i.e., "printed matter".' http://api.corrasable.com/syllables
```

```json
[
  [
    { "My": 1 },
    { "sense": 1 },
    { "of": 1 },
    { "language": 2 },
    { "is": 1 },
    { "that": 1 },
    { "it": 1 },
    { "is": 1 },
    { "matter": 2 },
    { "and": 1 },
    { "not": 1 },
    { "ideas": 3 },
    { "-": 0 },
    { "i": 1 },
    { ".e": 1 },
    { ".": 0 },
    { ",": 0 },
    { "\"printed": 2 },
    { "matter\"": 2 },
    { ".": 0 }
  ]
]
```

### Words

```bash
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
