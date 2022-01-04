PROG=ytfzf
PREFIX=/usr/local
BINDIR=${PREFIX}/bin
MANDIR=${PREFIX}/share/man

man:
	mkdir -p ${DESTDIR}${MANDIR}/man1
	mkdir -p ${DESTDIR}${MANDIR}/man5
	install docs/man/ytfzf.1 ${DESTDIR}${MANDIR}/man1
	install docs/man/ytfzf.5 ${DESTDIR}${MANDIR}/man5

install:
	chmod 755 ${PROG}
	mkdir -p ${DESTDIR}${BINDIR}
	install ${PROG} ${DESTDIR}${BINDIR}/${PROG}

uninstall:
	rm -f ${DESTDIR}${MANDIR}/man1/ytfzf.1
	rm -f ${DESTDIR}${MANDIR}/man1/ytfzf.5
	rm -f ${DESTDIR}${BINDIR}/${PROG}

.PHONY: install uninstall man
