module lang::cpp::Pacman

import util::Resources;
import lang::cpp::AST;
import IO;

@memo
Declaration player(int i) 
  = parseCpp(|project://pacman-cpp/Player.cpp|, 
      includePaths=classPaths["mac-xcode"]+ [location(|project://pacman-cpp/Bool-Engine|), location(|project://pacman-cpp/|)]);