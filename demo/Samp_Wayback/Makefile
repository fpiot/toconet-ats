SUBDIRS := EndDevice Parent Router

all clean:
	$(foreach i,$(SUBDIRS),$(MAKE) -C $i $@ &&) true

.PHONY: all clean
