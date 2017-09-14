module lang::pico::CyclomaticComplexity

import lang::pico::MyPico;

int cc(start[Program] program) {
   int result = 1;
   
   visit (program) {
     case (Statement) `<Id id> := <Expression e>`: result += 0;
   }

   return result;
}