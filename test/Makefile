test:
	@../bison -Lperl -d ptest.y 2>&1 | grep bison.simple && (\
		echo "";\
		echo "	It looks like you can't find the template file.";\
		echo "	Try running ./configure --prefix=\`pwd\` for a";\
		echo "	quick test, or make install before running this test";\
		echo "";\
		exit 1 \
	)
	perl -P ptest.driver
	@echo "Output should be \"Answer is 4.428...\""
