
all: bin/Vault.jar

bin/Vault.jar: build/Vault.jar
	mkdir -p bin
	cp build/Vault.jar bin/Vault.jar

build/Vault.jar:
	mkdir -p build
	curl "http://dev.bukkit.org/media/files/894/359/Vault.jar" -z build/Vault.jar -o build/Vault.jar --verbose --silent --location

.PHONY: build/Vault.jar
