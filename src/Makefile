
all: ../inst/NGmerge

NGmerge/NGmerge:
	cd NGmerge; \
	make; \
	cd ..; \
	echo “Make of NGmerge DONE”

../inst/NGmerge: NGmerge/NGmerge
	mv NGmerge/bin ../inst
	echo “Copy of NGmerge DONE”

.PHONY: clean
clean:
	rm -f NGmerge/*.o
	rm -f ../inst/NGmerge ../inst/
