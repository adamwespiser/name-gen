# name-gen
A silly little haskell program that generates project names in the form of `project name == "adjective" + "noun"`.     
The list of adjectives and nouns were selected from lists of words with high semantic scores, or words that are more often found in positive sentences.    

### How to run
Have `stack` installed, and just run `$ ./exec.sh`, which will build, and execute the program, piping through `less` for easier viewing.    

### Sample Output
```
 red cashback
 remote effort
 black sweetheart
 spotted spell
 buttery toll
 respectful morality
 indolent blame
 dreary audible
 infantile multi-purpose
 international remedy
 fabulous compatibility
 miniature enjoyment
 cautious diplomat
 piercing victory
 untimely clear-cut
 carefree value
 puny wellbeing
 adept cashback
````

### Sources
[noun word list](https://github.com/jeffreybreen/twitter-sentiment-analysis-tutorial-201107/blob/master/data/opinion-lexicon-English/positive-words.txt)    
[partial adjective source](http://www.ashley-bovan.co.uk/words/partsofspeech.html)    

