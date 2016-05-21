
all: bin/Multiverse-Core.jar

bin/Multiverse-Core.jar: build/Multiverse-Core.jar
	mkdir -p bin
	cp build/Multiverse-Core.jar bin/Multiverse-Core.jar

build/Multiverse-Core.jar:
	mkdir -p build
	curl "https://ci.onarandombox.com/job/Multiverse-Core/lastSuccessfulBuild/artifact/target/Multiverse-Core-2.5.0-SNAPSHOT.jar" -z build/Multiverse-Core.jar -o build/Multiverse-Core.jar --verbose --silent --location

.PHONY: build/Multiverse-Core.jar
