PROG=ytfzf

UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
    PREFIX = /usr/local/bin
endif
ifeq ($(UNAME), FreeBSD)
    PREFIX = /usr/local/bin
endif
ifeq ($(UNAME), Linux)
    PREFIX = /usr/bin
endif

install:
	chmod 755 $(PROG)
	mkdir -p ${DESTDIR}${PREFIX}
	install ${PROG} ${DESTDIR}${PREFIX}/${PROG}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/${PROG}

.PHONY: install uninstall
