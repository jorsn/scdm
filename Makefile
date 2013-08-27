prefix		:= /usr/local
bindir		:= $(prefix)/bin
docdir		:= $(prefix)/share/doc/scdm
etcdir		:= /etc

.PHONY: install

all: install

install:
	install -d $(bindir) $(docdir) $(etcdir)
	install -Dm755 scdm $(bindir)
	install -Dm644 cdmrc $(etcdir)
	install -Dm644 README.md LICENSE profile.sh $(docdir)
