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

man:
	gzip -c docs/man/ytfzf.1 > docs/man/ytfzf.1.gz
	gzip -c docs/man/ytfzf.5 > docs/man/ytfzf.5.gz
	install docs/man/ytfzf.1.gz /usr/share/man/man1
	install docs/man/ytfzf.5.gz /usr/share/man/man5

install:
	chmod 755 $(PROG)
	mkdir -p ${DESTDIR}${PREFIX}
	install ${PROG} ${DESTDIR}${PREFIX}/${PROG}

uninstall:
	rm -f /usr/share/man/man1/ytfzf.1.gz
	rm -f /usr/share/man/man1/ytfzf.5.gz
	rm -f ${DESTDIR}${PREFIX}/${PROG}

.PHONY: install uninstall man
