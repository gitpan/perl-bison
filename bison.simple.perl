# This is happy joyful -*-perl-*- code!!
#line 3 "bison.simple.perl"

#    Skeleton output parser for bison,
#    Copyright (C) 1984, 1989, 1990 Free Software Foundation, Inc.

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2, or (at your option)
#    any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

#    As a special exception, when this file is copied by Bison into a
#    Bison output file, you may use that output file without restriction.
#    This special exception was added by the Free Software Foundation
#    in version 1.24 of Bison.

#    This is the parser code that is written into each bison parser
#    when the %semantic_parser declaration is not specified in the grammar.
#    It was written by Richard Stallman by simplifying the hairy parser
#    used when %semantic_parser is specified.

#    Note: there must be only one dollar sign in this file.
#    It is replaced by the list of actions, each action
#    as one case of the switch.

#define yyerrok		($yyerrstatus = 0)
#define yyclearin	($yychar = YYEMPTY)
#define YYEMPTY		-2
#define YYEOF		0
#define YYACCEPT	return(0)
#define YYABORT 	return(1)
#define YYERROR		{ goto yyerrlab1; }
#    Like YYERROR except do call yyerror.
#    This remains here temporarily to ease the
#    transition to the new meaning of YYERROR, for GCC.
#    Once GCC version 2 has supplanted version 1, this can go.
#define YYFAIL		{ goto yyerrlab; }
#define YYRECOVERING()  (!!yyerrstatus)
#define YYBACKUP(token, value) \
do								\
    if ($yychar == YYEMPTY && $yylen == 1)			\
{ $yychar = (token), $yylval = (value);			\
      $yychar1 = YYTRANSLATE ($yychar);				\
	  YYPOPSTACK;						\
	      goto yybackup;						\
	      }								\
    else								\
{ yyerror("syntax error: cannot back up"); YYERROR; }	\
    while (0)

#define YYTERROR	1
#define YYERRCODE	256

#ifndef YYPURE
#define YYLEX		yylex()
#endif

#ifdef YYPURE
#ifdef YYLSP_NEEDED
#ifdef YYLEX_PARAM
#define YYLEX		yylex(\$yylval, \$yylloc, YYLEX_PARAM)
#else
#define YYLEX		yylex(\$yylval, \$yylloc)
#endif
#else
#ifdef YYLEX_PARAM
#define YYLEX		yylex(\$yylval, YYLEX_PARAM)
#else
#define YYLEX		yylex(\$yylval)
#endif
#endif
#endif

# If nonreentrant, generate the variables here

#ifndef YYPURE

    local($yychar);			#  the lookahead symbol		
local($yylval);			#  the semantic value of the	
#  lookahead symbol		

#ifdef YYLSP_NEEDED
local($yylloc);			#  location data for the lookahead
#  symbol				
#endif

local($yynerrs);		#  number of parse errors so far       
#endif  # not YYPURE

#if YYDEBUG != 0
local($yydebug);		#  nonzero means print parse trace
# Since this is uninitialized, it does not stop multiple parsers
#   from coexisting.
#endif


#line 109 "bison.simple.perl"

sub yyparse
{
    my $yystate;
    my $yyn;
    my $yyssp;
    my $yyvsp;
    my $yyerrstatus;    #  number of tokens to shift before error messages enabled
    my $yychar1 = 0;	#  lookahead token as an internal (translated) token number
    
    my @yyssa;	        #  the state stack			
    my @yyvsa;	        #  the semantic value stack		

    my $yyss = \@yyssa; # refer to the stacks thru separate pointers
    my $yyvs = \@yyvsa; #  to allow yyoverflow to reallocate them elsewhere 

#ifdef YYLSP_NEEDED
    my @yylsa;	        #  the location stack			
    my $yyls = \@yylsa;
    my $yylsp;

#define YYPOPSTACK   ($yyvsp--, $yyssp--, $yylsp--)
#else
#define YYPOPSTACK   ($yyvsp--, $yyssp--)
#endif

#ifdef YYPURE
    my $yychar;
    my $yylval;
    my $yynerrs;
#ifdef YYLSP_NEEDED
    my $yylloc;
#endif
#endif

    my $yyval;  		#  the variable used to return		
    #  semantic values from the action	
    #  routines				

    my $yylen;

#if YYDEBUG != 0
    print STDERR "Starting parse\n" if $yydebug;
#endif

    $yystate = 0;
    $yyerrstatus = 0;
    $yynerrs = 0;
    $yychar = YYEMPTY;		# Cause a token to be read.  

    # Initialize stack pointers.
    #  Waste one element of value and location stack
    #  so that they stay on the same level as the state stack.
    #  The wasted elements are never initialized. 

    $yyssp = -1;
    $yyvsp = 0;
#ifdef YYLSP_NEEDED
    $yylsp = 0;
#endif

# Push a new state, which is found in  yystate  . 
# In all cases, when you get here, the value and location stacks
#   have just been pushed. so pushing a state here evens the stacks.
yynewstate:

    $yyss[++$yyssp] = $yystate;

#if YYDEBUG != 0
    print STDERR "Entering state $yystate\n" if $yydebug;
#endif

yybackup:

# Do appropriate processing given the current state.
# Read a lookahead token if we need one and do not already have one.
# yyresume:

    # First try to decide what to do without reference to lookahead token.

    $yyn = $yypact[$yystate];
    if ($yyn == YYFLAG) {
	goto yydefault;
    }

    # Not known => get a lookahead token if do not already have one.

    # yychar is either YYEMPTY or YYEOF
    # or a valid token in external form. 

    if ($yychar == YYEMPTY)
    {
#if YYDEBUG != 0
	print STDERR "Reading a token: " if $yydebug;
#endif
	$yychar = YYLEX;
    }

    # Convert token to internal form (in yychar1) for indexing tables with

    if ($yychar <= 0)		# This means end of input.
    {
	$yychar1 = 0;
	$yychar = YYEOF;		# do not call YYLEX any more

#if YYDEBUG != 0
	printf STDERR "Now at end of input.\n" if $yydebug;
#endif
    }
    else
    {
	$yychar1 = YYTRANSLATE($yychar);

#if YYDEBUG != 0
	if ($yydebug)
	{
	    print STDERR "Next token is $yychar ($yytname[$yychar1]";
	    # Give the individual parser a way to print the precise meaning
	    # of a token, for further debugging info.
#ifdef YYPRINT
	    YYPRINT (STDERR, $yychar, $yylval);
#endif
	    print STDERR ")\n";
	}
#endif
    }

    $yyn += $yychar1;
    if ($yyn < 0 || $yyn > YYLAST || $yycheck[$yyn] != $yychar1) {
	goto yydefault;
    }

    $yyn = $yytable[$yyn];

#    yyn is what to do for this token type in this state.
#      Negative => reduce, -yyn is rule number.
#      Positive => shift, yyn is new state.
#        New state is final state => do not bother to shift,
#        just return success.
#      zero, or most negative number => error.

    if ($yyn < 0) {
	goto yyerrlab if ($yyn == YYFLAG);
	$yyn = -$yyn;
	goto yyreduce;
    } elsif ($yyn == 0) {
	goto yyerrlab;
    }

    if ($yyn == YYFINAL) {
	YYACCEPT;
    }

    # Shift the lookahead token.

#if YYDEBUG != 0
    print STDERR "Shifting token $yychar ($yytname[$yychar1]), " if $yydebug;
#endif

    # Discard the token being shifted unless it is eof.
    if ($yychar != YYEOF) {
	$yychar = YYEMPTY;
    }

    $yyvs[++$yyvsp] = $yylval;
#ifdef YYLSP_NEEDED
    $yyls[++$yylsp] = $yylloc;
#endif

    # count tokens shifted since error; after three, turn off error status.
    $yyerrstatus-- if $yyerrstatus;

    $yystate = $yyn;
    goto yynewstate;

# Do the default action for the current state.
yydefault:

    $yyn = $yydefact[$yystate];
    goto yyerrlab if ($yyn == 0);

# Do a reduction.  yyn is the number of a rule to reduce with.
yyreduce:
    $yylen = $yyr2[$yyn];
    if ($yylen > 0) {
	$yyval = $yyvs[$yyvsp + 1 - $yylen]; # implement default value of the action
    }

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

    $%!   # the action file gets copied in in place of this line

#line 314 "bison.simple.perl"

	$yyvsp -= $yylen;
    $yyssp -= $yylen;
#ifdef YYLSP_NEEDED
    $yylsp -= $yylen;
#endif

#if YYDEBUG != 0
    print STDERR "state stack now ",join(" ",@yyss[0..$yyssp+1]),"\n" 
	if $yydebug;
#endif

    $yyvs[++$yyvsp] = $yyval;

#ifdef YYLSP_NEEDED
    $yylsp++;
    if ($yylen == 0) {
	$yyls[$yylsp] = $yylloc;
	$yyls[$yylsp]->{text} = '';
    }
    else
    {
	$yyls[$yylsp]->{last_line} = $yyls[$yylsp+$yylen-1]->{last_line};
	$yyls[$yylsp]->{last_column} = $yyls[$yylsp+$yylen-1]->{last_column};
    }
#endif

#      Now "shift" the result of the reduction.
#      Determine what state that goes to,
#      based on the state we popped back to
#      and the rule number reduced by.

    $yyn = $yyr1[$yyn];

    $yystate = $yypgoto[$yyn - YYNTBASE] + $yyss[$yyssp];
    if ($yystate >= 0 && $yystate <= YYLAST && $yycheck[$yystate] == $yyss[$yyssp]) {
	$yystate = $yytable[$yystate];
    } else {
	$yystate = $yydefgoto[$yyn - YYNTBASE];
    }

    goto yynewstate;

yyerrlab:   # here on detecting error

    if (! $yyerrstatus)
	# If not already recovering from an error, report this error.
    {
	++$yynerrs;

#ifdef YYERROR_VERBOSE
	$yyn = $yypact[$yystate];

	if ($yyn > YYFLAG && $yyn < YYLAST)
	{
	    my $size = 0;
	    my $msg;
	    my ($x, $count);

	    $count = 0;
	    # Start X at -yyn if nec to avoid negative indexes in yycheck.
	    for ($x = ($yyn < 0 ? -$yyn : 0);
		 $x < $yytname_size; $x++) {
		if ($yycheck[$x + $yyn] == $x) {
		    $size += length($yytname[$x]) + 15, $count++;
		}
	    }

	    $msg = "parse error";

	    if ($count < 5)
	    {
		$count = 0;
		for ($x = ($yyn < 0 ? -$yyn : 0);
		     $x < $yytname_size; x++) {
		    if ($yycheck[$x + $yyn] == $x)
		    {
			$msg .= $count == 0 ? ", expecting `" : " or `";
			$msg .= $ttyname[$x];
			$msg .= "'";
			$count++;
		    }
		}
	    }
	    yyerror($msg);
	}
	else
#endif # YYERROR_VERBOSE
	    yyerror("parse error");
    }

    goto yyerrlab1;
yyerrlab1:   # here on error raised explicitly by an action

    if ($yyerrstatus == 3)
    {
	# _if just tried and failed to reuse lookahead token after an error, discard it.

	# return failure if at end of input
	if ($yychar == YYEOF) {
	    YYABORT;
	}

#if YYDEBUG != 0
	if ($yydebug) {
	    print STDERR "Discarding token $yychar ($yytname[$yychar1]).\n";
	}
#endif

	$yychar = YYEMPTY;
    }

    # _Else will try to reuse lookahead token
    #   after shifting the error token.

    $yyerrstatus = 3;		# Each real token shifted decrements this

    goto yyerrhandle;

yyerrdefault:  # current state does not do anything special for the error token.

    1;

yyerrpop:   # pop the current state because it cannot handle the error token

    YYABORT if ($yyssp == 0); 
    $yyvsp--;
    $yystate = $yyss[--$yyssp];
#ifdef YYLSP_NEEDED
    $yylsp--;
#endif

#if YYDEBUG != 0
    print STDERR "state stack now",join(" ",@yyss[0..$yyssp+1]),"\n" 
	if $yydebug;
#endif

yyerrhandle:

    $yyn = $yypact[$yystate];
    goto yyerrdefault if ($yyn == YYFLAG);

    $yyn += YYTERROR;
    if ($yyn < 0 || $yyn > YYLAST || $yycheck[$yyn] != YYTERROR) {
	goto yyerrdefault;
    }

    $yyn = $yytable[$yyn];
    if ($yyn < 0)
    {
	if ($yyn == YYFLAG) {
	    goto yyerrpop;
	}
	$yyn = -$yyn;
	goto yyreduce;
    }
    elsif ($yyn == 0) {
	goto yyerrpop;
    }

    YYACCEPT if ($yyn == YYFINAL);

#if YYDEBUG != 0
    print "Shifting error token, " if $yydebug;
#endif

    $yyvs[++$yyvsp] = $yylval;
#ifdef YYLSP_NEEDED
    $yyls[++$yylsp] = $yylloc;
#endif

    $yystate = $yyn;
    goto yynewstate;
}
