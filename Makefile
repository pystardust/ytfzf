PROG=ytfzf

PREFIX = /usr/bin

install:
	chmod 755 $(PROG)
	install ${PROG} ${DESTDIR}${PREFIX}/${PROG}

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/${PROG}

.PHONY: install uninstall
