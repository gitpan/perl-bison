%token ID
%token NUM

%%

top: expr { print "Answer is ", $1, "\n"; };

expr: 
  expr expr '+' { $$ = ($1 + $2); }
| expr expr '-' { $$ = ($1 - $2); }
| expr expr '*' { $$ = ($1 * $2); }
| expr expr '/' { $$ = ($1 / $2); }
| expr '~' { $$ = -$1; }
| expr "sin" { $$ = sin($1); }
| NUM { $$ = $1; };

%%
