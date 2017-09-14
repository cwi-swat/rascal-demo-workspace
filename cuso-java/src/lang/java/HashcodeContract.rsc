module lang::java::HashcodeContract

loc equalsMethod = |java+method:///java/lang/Object/equals(java.lang.Object)|;
loc hashCodeMethod = |java+method:///java/lang/Object/hashCode()|;

set[Message] checkEqualsContract(M3 m) {
    overrides = (m.methodOverrides<to,from>)+;

    equals = overrides[equalsMethod];
    hashCodes = overrides[hashCodeMethod];

    violators 
      = {};
    
    return { warning("hashCode not implemented", onlyEquals)
        | cl <- violators, onlyEquals <- (m.containment[cl] & equals) };
}