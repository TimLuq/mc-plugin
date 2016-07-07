
all: bin/PermissionsEx.jar

bin/PermissionsEx.jar: build/PermissionsEx.jar
	mkdir -p bin
	cp build/PermissionsEx.jar bin/PermissionsEx.jar

build/PermissionsEx.jar:
	mkdir -p build
	$(SCRIPTDIR)/funcs/curse-bukkit permissionsex build/PermissionsEx.jar

.PHONY: build/PermissionsEx.jar
