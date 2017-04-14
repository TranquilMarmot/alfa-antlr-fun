/** ALFA Grammar Definition
*/
grammar ALFA;

/*
 * Parser Rules
 */

r
    : policyset+
    | eof
    ;

policyset : PolicySet policyset_name policyset_expr;
policyset_name : NAME;

policyset_expr : BR_OPEN policy+ BR_CLOSE;

policy : Policy policy_name policy_expr;

policy_name : NAME;
policy_expr : BR_OPEN a_rule+ BR_CLOSE;

a_rule : Rule rule_expr;

rule_expr : BR_OPEN rule_effect target BR_CLOSE;

rule_effect
    : Permit
    | Deny
    ;

target : Target Clause target_expr;

target_expr : targetIdentifier operator target_value;

targetIdentifier : WORD ('.' WORD)*;

target_value : STRING;

operator
    : EqEq
    | NotEq
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
Clause : 'clause';

EqEq : '==';
NotEq : '!=';

BR_OPEN : '{';
BR_CLOSE : '}';

NAME
   : [_A-Za-z] [_0-9A-Za-z]*
   ;

HEX
    : ('%' [a-fA-F0-9] [a-fA-F0-9])+
    ;

STRING
   : '"' ( ~ ["\\] )* '"'
   ;

WORD
   : ([a-zA-Z~] |HEX) ([a-zA-Z0-9.-] | HEX)*
   ;

DIGITS
   : [0-9] +
   ;

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
