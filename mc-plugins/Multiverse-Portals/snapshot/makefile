
all: bin/Multiverse-Portals.jar

bin/Multiverse-Portals.jar: build/Multiverse-Portals.jar
	mkdir -p bin
	cp build/Multiverse-Portals.jar bin/Multiverse-Portals.jar

build/Multiverse-Portals.jar:
	mkdir -p build
	curl "https://ci.onarandombox.com/job/Multiverse-Portals/lastSuccessfulBuild/artifact/target/Multiverse-Portals-2.5.0-SNAPSHOT.jar" -z build/Multiverse-Portals.jar -o build/Multiverse-Portals.jar --verbose --silent --location

.PHONY: build/Multiverse-Portals.jar
