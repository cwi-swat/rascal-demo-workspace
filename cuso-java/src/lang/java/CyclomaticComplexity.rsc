module lang::java::CyclomaticComplexity

import lang::java::jdt::m3::AST;


int calcCC(Statement impl) {
        int result = 1;
        visit (impl) {
                case \if(_,_) : result += 1;
                case \if(_,_,_) : result += 1;
                case \while(_,_) : result += 1;
                
        }
        return result;
}

