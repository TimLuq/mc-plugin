
all: bin/PermissionsEx.jar

bin/PermissionsEx.jar: build/PermissionsEx.jar
	mkdir -p bin
	cp build/PermissionsEx.jar bin/PermissionsEx.jar

build/PermissionsEx.jar:
	mkdir -p build
	curl "http://dev.bukkit.org/media/files/909/154/PermissionsEx-1.23.4.jar" -z build/PermissionsEx.jar -o build/PermissionsEx.jar --verbose --silent --location

.PHONY: build/PermissionsEx.jar
