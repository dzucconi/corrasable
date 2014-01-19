# Corrasable

https://github.com/dzucconi/corrasable

*Corrasable* is a web service that packages together tools like [Lingua](http://www.pressure.to/ruby/) and [The CMU Pronouncing Dictionary](http://www.speech.cs.cmu.edu/cgi-bin/cmudict) to assist in analyzing text and converting it into alternate representations.

----

### Report

```bash
curl -d "text=But when Leviathan is the text, the case is altered. Fain am I to stagger to this emprise under the weightiest words of the dictionary. And here be it said, that whenever it has been convenient to consult one in the course of these dissertations, I have invariably used a huge quarto edition of Johnson, expressly purchased for that purpose; because that famous lexicographer's uncommon personal bulk more fitted him to compile a lexicon to be used by a whale author like me." http://api.corrasable.com
```

```json
{
    "num_paragraphs": 1,
    "num_sentences": 3,
    "num_chars": 340,
    "num_characters": 340,
    "num_words": 60,
    "num_syllables": 91,
    "num_unique_words": 48,
    "words_per_sentence": 20.0,
    "syllables_per_word": 1.51666666666667,
    "kincaid": 10.1066666666667,
    "flesch": 58.2250000000001,
    "fog": 13.3333333333333,
    "percent_fog_complex_words": 13.3333333333333,
    "text": "But when Leviathan is the text, the case is altered. Fain am I to stagger to this emprise under the weightiest words of the dictionary. And here be it said, that whenever it has been convenient to consult one in the course of these dissertations, I have invariably used a huge quarto edition of Johnson, expressly purchased for that purpose",
    "paragraphs": ["But when Leviathan is the text, the case is altered. Fain am I to stagger to this emprise under the weightiest words of the dictionary. And here be it said, that whenever it has been convenient to consult one in the course of these dissertations, I have invariably used a huge quarto edition of Johnson, expressly purchased for that purpose"],
    "sentences": ["But when Leviathan is the text, the case is altered.", "Fain am I to stagger to this emprise under the weightiest words of the dictionary.", "And here be it said, that whenever it has been convenient to consult one in the course of these dissertations, I have invariably used a huge quarto edition of Johnson, expressly purchased for that purpose"],
    "words": ["But", "when", "Leviathan", "is", "the", "text", "the", "case", "is", "altered", "Fain", "am", "I", "to", "stagger", "to", "this", "emprise", "under", "the", "weightiest", "words", "of", "the", "dictionary", "And", "here", "be", "it", "said", "that", "whenever", "it", "has", "been", "convenient", "to", "consult", "one", "in", "the", "course", "of", "these", "dissertations", "I", "have", "invariably", "used", "a", "huge", "quarto", "edition", "of", "Johnson", "expressly", "purchased", "for", "that", "purpose"],
    "unique_words": ["But", "when", "Leviathan", "is", "the", "text", "case", "altered", "Fain", "am", "I", "to", "stagger", "this", "emprise", "under", "weightiest", "words", "of", "dictionary", "And", "here", "be", "it", "said", "that", "whenever", "has", "been", "convenient", "consult", "one", "in", "course", "these", "dissertations", "have", "invariably", "used", "a", "huge", "quarto", "edition", "Johnson", "expressly", "purchased", "for", "purpose"],
    "frequencies": {
        "But": 1,
        "when": 1,
        "Leviathan": 1,
        "is": 2,
        "the": 5,
        "text": 1,
        "case": 1,
        "altered": 1,
        "Fain": 1,
        "am": 1,
        "I": 2,
        "to": 3,
        "stagger": 1,
        "this": 1,
        "emprise": 1,
        "under": 1,
        "weightiest": 1,
        "words": 1,
        "of": 3,
        "dictionary": 1,
        "And": 1,
        "here": 1,
        "be": 1,
        "it": 2,
        "said": 1,
        "that": 2,
        "whenever": 1,
        "has": 1,
        "been": 1,
        "convenient": 1,
        "consult": 1,
        "one": 1,
        "in": 1,
        "course": 1,
        "these": 1,
        "dissertations": 1,
        "have": 1,
        "invariably": 1,
        "used": 1,
        "a": 1,
        "huge": 1,
        "quarto": 1,
        "edition": 1,
        "Johnson": 1,
        "expressly": 1,
        "purchased": 1,
        "for": 1,
        "purpose": 1
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
