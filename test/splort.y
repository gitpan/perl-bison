%token NUM

%{

my @lbls=();

%}


%%

top: asmcode {
};

asmcode: asmcode_sub
= {
   my $lbl=$lbls [0];
    my $temp1=${$lbl}[1];
};

asmcode_sub: {$$="";} ;

%%
