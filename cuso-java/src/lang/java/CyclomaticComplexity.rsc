module lang::java::CyclomaticComplexity

import lang::java::jdt::m3::AST;
import lang::java::jdt::m3::Core;
import IO;
 
 data Aap(int z = -776) = aap(int i = 0) | noot();
 
void init() {
  createM3FromEclipseProject(|project://snakes-and-ladders-java|);
  println("Initialized name lookup for snakes and ladders");
} 

rel[loc method, int metric] salcc() = projectcc(|project://snakes-and-ladders-java|);

rel[loc method, int metric] projectcc(loc project) 
  = { <d, calcCC(body)> | /method(_, _, _, _, Statement body, decl=d) := createAstsFromEclipseProject(project, true)};

int calcCC(Statement body) {
        int result = 1;
        visit (body) {
                case \if(_,_) : result += 1;
                case \if(_,_,_) : result += 1;
                case \while(_,_) : result += 1;
                // TODO: add the missing cases
        }
        return result;
}

