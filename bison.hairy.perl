
local($timeclock);


local($yyerror);	#  Yyerror and yycost are set by guards.	
local($yycost);		#  If yyerror is set to a nonzero value by a	
                        #  guard, the reduction with which the guard	
                        #  is associated is not performed, and 	
                        #  the error recovery mechanism is invoked.	
                        #  Yycost indicates the cost of performing	
                        #  the reduction given the attributes of the	
                        #  symbols.					


#  YYMAXDEPTH indicates the size of the parser state and value	
#  stacks.								

#ifndef	YYMAXDEPTH
#define	YYMAXDEPTH	500
#endif

#  YYMAXRULES must be at least as large as the number of rules that	
#  could be placed in the rule queue.  That number could be determined	
#  from the grammar and the size of the stack, but, as yet, it is not.	

#ifndef	YYMAXRULES
#define	YYMAXRULES	100
#endif

#ifndef	YYMAXBACKUP
#define YYMAXBACKUP	100
#endif

#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR         return($yyerror = 1)

local(@yyss);			#  the state stack			
local(@yyvs);			#  the semantic value stack		
local($yyls);			#  the location stack			
local($yyrqt);			#  the rule queue			
local($yyrq) = 0;		#  the rule queue (main index -- ???)
local($yychar);			#  the lookahead symbol		

local($yylval);			#  the semantic value of the		
#  lookahead symbol			

local($yytval);			#  the semantic value for the state	
#  at the top of the state stack.	

local($yyval);			#  the variable used to return		
#  semantic values from the action	
#  routines				

local($yylloc);			#  location data for the lookahead	
#  symbol				

local($yytloc);			#  location data for the state at the	
#  top of the state stack		


local($yynunlexed) = 0;
local(@yyunchar);
local(@yyunval);
local(@yyunloc);

local($yygssp);			#  a pointer to the top of the state	
                                #  stack; only set during error recovery.

local($yygvsp);			#  a pointer to the top of the value	
                                #  stack; only set during error	recovery

local($yyglsp);			#  a pointer to the top of the location
                                #  stack; only set during error	recovery


#  Yyget is an interface between the parser and the lexical analyzer.	
#  It is costly to provide such an interface, but it avoids requiring	
#  the lexical analyzer to be able to back up the scan.		

sub yyget()
{
    if ($yynunlexed > 0) {
#if YYDEBUG != 0
	print STDERR "Rereading a token: " if $yydebug;
#endif
	$yynunlexed--;
	$yychar = $yyunchar[$yynunlexed];
	$yylval = $yyunval[$yynunlexed];
	$yylloc = $yyunloc[$yynunlexed];
    } elsif ($yychar <= 0) {
	$yychar = 0;
    } else {
	$yychar = yylex();
#if YYDEBUG != 0
	print STDERR "Reading a token: " if $yydebug;
#endif
	if ($yychar < 0) {
	    $yychar = 0;
	} else {
	    $yychar = YYTRANSLATE($yychar);
	}
    }

#if YYDEBUG != 0
    if ($yydebug) {
	print STDERR "Next token is ";
	# Give the individual parser a way to print the precise meaning
	# of a token, for further debugging info.
#ifdef YYPRINT
	YYPRINT (STDERR, $yychar, $yylval);
#else
	print STDERR "$yytname[$yychar]\n";
#endif
    }
#endif
}



sub yyunlex($$$)
{
    ($yyunchar[$yynunlexed], $yyunval[$yynunlexed], $yyunloc[$yynunlexed]) = @_;
    $yynunlexed++;
#if YYDEBUG != 0
	print STDERR "Unlexing token $yytname[$yychar], total unlexed = $yynunlexed\n" if $yydebug;
#endif
}



sub yyrestore($$)
{
    my ($first, $last) = @_;

    my $ssp;
    my $rp;
    my $symbol;
    my $state;
    my $tvalsaved;

    $ssp = $yygssp;
    yyunlex($yychar, $yylval, $yylloc);

    $tvalsaved = 0;
    while ($first != $last)
    {
	$symbol = $yystos[$yyss[$ssp]];
	if ($symbol < YYNTBASE)	{
	    yyunlex($symbol, $yytval, $yytloc);
	    $tvalsaved = 1;
	    $ssp--;
	}

	$ssp--;

	if ($first == $yyrq) {
	    $first = $yyrq + YYMAXRULES;
	}

	$first--;

	for ($rp = $yyprhs[$yyrqt[$first]]; $symbol = $yyrhs[$rp]; $rp++)
	{
	    if ($symbol < YYNTBASE) {
		$state = $yytable[$yypact[$yyss[$ssp]] + $symbol];
	    } else {
		$state = $yypgoto[$symbol - YYNTBASE] + $yyss[$ssp];

		if ($state >= 0 && $state <= YYLAST && $yycheck[$state] == $yyss[$ssp]) {
		    $state = $yytable[$state];
		} else {
		    $state = $yydefgoto[$symbol - YYNTBASE]; 
		}
	    }

	    $yyss[++$ssp] = $state;
	}
    }

    if ( ! $tvalsaved && $ssp > 0) {
	yyunlex($yystos[$yyss[$ssp]], $yytval, $yytloc);
	$ssp--;
    }

    $yygssp = $ssp;
}



sub yyparse()
{
    my ($yystate);
    my ($yyn);
    my ($yyssp);
    my ($yyrq0);
    my ($yyptr);
    my ($yyvsp);

    my ($yylen);
    my ($yylsp);
    my ($yyrq1);
    my ($yyrq2);

#if YYDEBUG != 0
    print STDERR "Starting parse\n" if $yydebug;
#endif

    $yystate = 0;
    $yyssp = -1;
    $yyvsp = -1;
    $yylsp = -1;
    $yyrq0 = $yyrq;
    $yyrq1 = $yyrq0;
    $yyrq2 = $yyrq0;

    $yychar = 1; # Hack to force yylex() to be called (must be >= 0)
    yyget();

# Push a new state, which is found in  yystate  . 
# In all cases, when you get here, the value and location stacks
#   have just been pushed. so pushing a state here evens the stacks.
yynewstate:

#if YYDEBUG != 0
    print STDERR "Entering state $yystate\n" if $yydebug;
#endif

    if ($yyssp >= YYMAXDEPTH - 1) {
	yyabort("Parser Stack Overflow");
	YYABORT;
    }

    $yyss[++$yyssp] = $yystate;

# Do appropriate processing given the current state.
# Read a lookahead token if we need one and do not already have one.
yyresume:

    $yyn = $yypact[$yystate];
    goto yydefault if ($yyn == YYFLAG);

    $yyn += $yychar;
    goto yydefault if ($yyn < 0 || $yyn > YYLAST || $yycheck[$yyn] != $yychar);

    $yyn = $yytable[$yyn];
    if ($yyn < 0) {
	$yyn = -$yyn;
	goto yyreduce;
    } elsif ($yyn == 0) {
	goto yyerrlab;
    }

    $yystate = $yyn;

#if YYDEBUG != 0
    print STDERR "Shifting token $yytname[$yychar]\n" if $yydebug;
#endif

    $yyptr = $yyrq2;
    while ($yyptr != $yyrq1)
    {
	$yyn = $yyrqt[$yyptr++];
	$yylen = $yyr2[$yyn];
	$yyvsp -= $yylen;
	$yylsp -= $yylen;

	yyguard($yyn, $yyvsp, $yylsp);
#if YYDEBUG != 0
	if ($yydebug && $yyerror) {
	    print STDERR "Guard failed($yyerror), going to error recovery\n";
	}
#endif
	goto yysemerr if ($yyerror);

	yyaction($yyn, $yyvsp, $yylsp);
	$yyvs[++$yyvsp] = $yyval;

	$yylsp++;

	if ($yylen == 0) {
	    $yyls[$yylsp]->{timestamp} = $timeclock;
	    $yyls[$yylsp]->{first_line} = $yytloc{first_line};
	    $yyls[$yylsp]->{first_column} = $yytloc{first_column};
	    $yyls[$yylsp]->{last_line} = $yyls[$yylsp-1]->{last_line};
	    $yyls[$yylsp]->{last_column} = $yyls[$yylsp-1]->{last_column};
	    $yyls[$yylsp]->{text} = "";
	}
	else
	{
	    $yyls[$yylsp]->{last_line} = $yyls[$yylsp+$yylen-1]->{last_line};
	    $yyls[$yylsp]->{last_column} = $yyls[$yylsp+$yylen-1]->{last_column};
	}
	
	if ($yyptr == $yyrq + YYMAXRULES) {
	    $yyptr = $yyrq;
	}
    }

    YYACCEPT if ($yystate == YYFINAL);

    $yyrq2 = $yyptr;
    $yyrq1 = $yyrq0;

    $yyvs[++$yyvsp] = $yytval;
    $yyls[++$yylsp] = $yytloc;
    $yytval = $yylval;
    $yytloc = $yylloc;
    yyget();

    goto yynewstate;

yydefault:

    $yyn = $yydefact[$yystate];
    goto yyerrlab if ($yyn == 0);

yyreduce:

#if YYDEBUG != 0
    if ($yydebug)
    {
	my $i;

	print STDERR "Reducing via rule $yyn (line $yyrline[$yyn]), ";

	# Print the symbols being reduced, and their result.
        for ($i = $yyprhs[$yyn]; $yyrhs[$i] > 0; $i++) {
	    print STDERR "$yytname[$yyrhs[$i]] ";
	}
	print STDERR " -> $yytname[$yyr1[$yyn]]\n";
    }
#endif
    $yyrqt[$yyrq0++] = $yyn;

    if ($yyrq0 == $yyrq + YYMAXRULES) {
	$yyrq0 = $yyrq;
    }

    if ($yyrq0 == $yyrq2) {
	yyabort("Parser Rule Queue Overflow");
	YYABORT;
    }

    $yyssp -= $yyr2[$yyn];
    $yyn = $yyr1[$yyn];

    $yystate = $yypgoto[$yyn - YYNTBASE] + $yyss[$yyssp];
    if ($yystate >= 0 && $yystate <= YYLAST && $yycheck[$yystate] == $yyss[$yyssp]) {
	$yystate = $yytable[$yystate];
    } else {
	$yystate = $yydefgoto[$yyn - YYNTBASE];
    }

#if YYDEBUG != 0
    print STDERR "state stack now ",join(" ",@yyss[0..$yyssp+1]),"\n" 
	if $yydebug;
#endif

    goto yynewstate;

yysemerr:
    $yyrqt[--$yyptr] = $yyn;
    $yyrq2 = $yyptr;
    $yyvsp += $yyr2[$yyn];

yyerrlab:

    $yygssp = $yyssp;
    $yygvsp = $yyvsp;
    $yyglsp = $yylsp;
    yyrestore($yyrq0, $yyrq2);
    yyrecover();
    $yystate = $yyss[$yygssp];
    $yyssp = $yygssp;
    $yyvsp = $yygvsp;
    $yyrq0 = $yyrq;
    $yyrq1 = $yyrq0;
    $yyrq2 = $yyrq0;
    goto yyresume;
} # yyparse

$%!
