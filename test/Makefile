test:
	@if ../bison -Lperl -d ptest.y 2>&1 | grep bison.simple; then \
		echo "";\
		echo "	It looks like you can't find the template file.";\
		echo "	Try running ./configure --prefix=\`pwd\` for a";\
		echo "	quick test, or make install before running this test";\
		echo "";\
		exit 1; \
	fi
	if perl -P ptest.driver | grep 'Answer is 4.428'; then echo Passed; \
	else echo Failed; exit 1; fi
