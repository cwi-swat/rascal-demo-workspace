module lang::cpp::Util

import Exception;
import lang::cpp::AST;

Declaration stripIncludes(Declaration tu) = tu[declarations=[d | d <- tu.declarations, tu.src.top == d.src.top]];

	