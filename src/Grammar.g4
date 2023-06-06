grammar Grammar;

program  :  PROGRAM id  {System.out.println("A1");} corpo PONTO {System.out.println("A30");} ;

corpo : declara? BEGIN sentencas END;

declara:VAR dvar mais_dc;

dvar : variaveis DOIS_PONTOS tipo_var;

tipo_var : INTEGER;

variaveis :id {System.out.println("A2");} mais_var?;

mais_var : VIRGULA variaveis;

mais_dc : PONTO_VIRGULA  cont_dc?;

cont_dc: dvar mais_dc;

sentencas : comando mais_sentencas;

mais_sentencas : PONTO_VIRGULA cont_sentencas?;

cont_sentencas:  sentencas;

var_read : id {System.out.println("A5");} mais_var_read?;

mais_var_read : VIRGULA var_read;

var_write : id {System.out.println("A6");} mais_var_write?;

mais_var_write : VIRGULA var_write;

comando : READ PARENTESES_ESQUERDO var_read PARENTESES_DIREITO |
          WRITE PARENTESES_ESQUERDO var_write PARENTESES_DIREITO |
          FOR id {System.out.println("A25");} DOIS_PONTOS_IGUAL expressao {System.out.println("A26");} TO {System.out.println("A27");} expressao  {System.out.println("A28");}
          DO BEGIN sentencas END {System.out.println("A29");} |
          REPEAT {System.out.println("A23");} sentencas UNTIL PARENTESES_ESQUERDO condicao PARENTESES_DIREITO {System.out.println("A24");}  |
          WHILE {System.out.println("A20");} PARENTESES_ESQUERDO condicao PARENTESES_DIREITO {System.out.println("A21");}  DO BEGIN sentencas END {System.out.println("A22");} |
          IF PARENTESES_ESQUERDO condicao PARENTESES_DIREITO {System.out.println("A17");} THEN BEGIN sentencas END {System.out.println("A18");}
          pfalsa? {System.out.println("A19");} |
          id {System.out.println("A13");} DOIS_PONTOS_IGUAL expressao {System.out.println("A14");};

condicao: expressao relacao {System.out.println("A15");} expressao {System.out.println("A16");};
pfalsa : ELSE BEGIN  sentencas END;
relacao: IGUAL
      | DIFERENTE
      | MENOR
      | MENOR_IGUAL
      | MAIOR
      | MAIOR_IGUAL;
expressao : termo outros_termos?;
outros_termos: op_ad {System.out.println("A9");} termo {System.out.println("A10");} outros_termos?;
op_ad : ADICAO | SUBTRACAO;
termo : fator mais_fatores?;
mais_fatores : op_mul {System.out.println("A11");} fator {System.out.println("A12");} mais_fatores?;
op_mul : MULTIPLICACAO | DIVISAO;
fator : id {System.out.println("A7");} | intnum {System.out.println("A8");}  |
        PARENTESES_ESQUERDO expressao PARENTESES_DIREITO;

intnum :  DIGITO+ {System.out.println("A4");};
id : IDENTIFICADOR  {System.out.println("A3");};



READ : R E A D;
PROGRAM  : P R O G R A M;
FOR : F O R;
REPEAT : R E P E A T;
WHILE : W H I L E;
IF : I F;
TO : T O;
UNTIL : U N T I L;
DO : D O;
BEGIN : B E G I N;
ELSE : E L S E;
THEN : T H E N;
END : E N D;
VAR : V A R;
INTEGER : I N T E G E R;
WRITE : W R I T E;
VIRGULA : ',';
LETRA : [A-Za-z];
DIGITO : [0-9];
PONTO_VIRGULA : ';';
PARENTESES_DIREITO : ')';
PARENTESES_ESQUERDO : '(';
DOIS_PONTOS_IGUAL: ':=';
DOIS_PONTOS : ':';
IGUAL        	 : '=' ;
MAIOR        	 : '>' ;
MAIOR_IGUAL      : '>=' ;
MENOR        	 : '<' ;
MENOR_IGUAL      : '<=' ;
DIFERENTE        : '<>';
MULTIPLICACAO    : '*' ;
DIVISAO       	 : '/' ;
ADICAO       	 : '+' ;
SUBTRACAO        : '-' ;
PONTO  : '.';
IDENTIFICADOR    : [a-zA-Z] ([a-zA-Z] | [0-9])* ;
WS : [ \t\r\n]+ -> skip ;
COMMENT : '{' .*? '}' -> skip;
LCOMMENT : '//' .*? '\r'? '\n' -> skip ;
fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];