module StemmingExample

import analysis::stemming::Snowball;
import IO;

set[str] wordsInFile(loc file) 
  = { w | /<w:[a-zA-Z]+>/ := readFile(file)};
  
set[str] stemAll(set[str] words) 
  = {stem(x) | x <- words};  
  
void demoStemming() {
  words = ["hello", "walking", "bikes", "entertained", "fietsen", "lopen", "gekocht"];
  
  for (w <- words) {
    println("The English stem of \'<w>\' is \'<stem(w, lang=english())>\',
            'while the Dutch stem is \'<stem(w, lang=dutch())>\'.");
  }
  
  println("As you can see, stemming algorithms are not perfect.");
}