prefix	:= /usr/local
bindir	:= $(prefix)/bin
docdir	:= $(prefix)/share/doc/scdm
mandir	:= $(prefix)/share/man/man1
etcdir	:= /etc

.PHONY: all install

all:
	@echo "make targets: install uninstall"

install: scdm scdmrc README.md LICENSE profile.sh scdm.1
	install -d $(bindir) $(docdir) $(etcdir) $(mandir)
	install -Dm755 scdm $(bindir)
	install -Dm644 scdmrc $(etcdir)
	install -Dm644 README.md LICENSE profile.sh $(docdir)
	install -Dm644 scdm.1 $(mandir)

uninstall:
	rm -f $(bindir)/scdm
	rm -rf $(docdir)
	rm -f $(mandir)/scdm.1
	@echo ''
	################################################################################
	# Your configuration in $(etcdir)/scdmrc was not uninstalled.
	# Ich you want it removed, please do that manually.
	################################################################################
	@echo ''
