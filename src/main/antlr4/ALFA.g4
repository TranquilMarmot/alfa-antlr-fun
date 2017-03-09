/** ALFA Grammar Definition
*/
grammar ALFA;

/*
 * Parser Rules
 */

r
    : COMMENT
    | LINE_COMMENT
    | eof
    ;

/*
 * Lexer Rules
 */

PolicySet : 'policyset';
Policy : 'policy';
Rule : 'rule';
Condition : 'condition';
// XACML Effect: Permit or Deny
Permit : 'permit';
Deny : 'deny';
Target : 'target';
Or : 'or'; // XACML: AnyOf
And : 'and'; // XACML: AllOf
Apply : 'apply'; // XACML: Policy/Rule Combining Algorithm
Obligation : 'obligation'; // XACML: ObligationExpression
Advice : 'advice'; // XACML: AdviceExpression

WS  :  [ \t\r\n\u000C]+ -> skip
    ;

COMMENT
    :   '/*' .*? '*/' -> skip
    ;

LINE_COMMENT
    :   '//' ~[\r\n]* -> skip
    ;

eof
 : EOF
 ;
