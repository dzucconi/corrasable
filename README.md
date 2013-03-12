# Corrasable

```bash
heroku create
heroku addons:add mongolab:starter
git push heroku master
rake dictionary:generate # todo
```

---

# Examples

```
POST /?text=Language operates between literal and metaphorical signification.
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

----

```
POST /phonemes?text=Language operates between literal and metaphorical signification.
```

```json
{
  "text": "L AE1 NG G W AH0 JH | AA1 P ER0 EY2 T S | B IH0 T W IY1 N | L IH1 T ER0 AH0 L | AH0 N D | M EH2 T AH0 F AO1 R IH0 K AH0 L | N/A"
}
```
