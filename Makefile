CPPS = cpp
TEMPDIR = ${PWD}/build_temp

.PYONY: all clean test

all: $(CPPS) setup.py decl.pxd ctime.pyx
	$(MAKE) -C $(CPPS)
	cp $(CPPS)/libtime.so ./
	python setup.py build_ext --inplace --build-temp $(TEMPDIR)

test:
	chmod +x test_ctime.py
	python test_ctime.py

clean:
	rm -rf $(TEMPDIR)
	rm -f *.so *.cpp *.c *.html
	$(MAKE) -C $(CPPS) clean
