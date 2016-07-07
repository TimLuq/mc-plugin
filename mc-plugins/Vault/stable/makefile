
all: bin/Vault.jar

bin/Vault.jar: build/Vault.jar
	mkdir -p bin
	cp build/Vault.jar bin/Vault.jar

build/Vault.jar:
	mkdir -p build
	$(SCRIPTDIR)/funcs/curse-bukkit vault build/Vault.jar

.PHONY: build/Vault.jar
