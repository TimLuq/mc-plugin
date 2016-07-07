
all: bin/EssentialsX.jar

bin/EssentialsX.jar: build/EssentialsX.jar
	mkdir -p bin
	cp build/EssentialsX.jar bin/EssentialsX.jar

build/EssentialsX.jar:
	mkdir -p build
	curl "https://ci.drtshock.net/job/EssentialsX/lastBuild/artifact/Essentials/target/EssentialsX-2.0.1.jar" -z build/EssentialsX.jar -o build/EssentialsX.jar --silent --location

.PHONY: build/EssentialsX.jar
