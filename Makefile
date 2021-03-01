PROG=ytfzf

PREFIX = /usr/local

install:
	chmod 755 $(PROG)
	install ${PROG} ${DESTDIR}${PREFIX}/bin/${PROG}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/${PROG}

.PHONY: install uninstall
