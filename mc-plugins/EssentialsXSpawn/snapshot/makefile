
all: bin/EssentialsXSpawn.jar

bin/EssentialsXSpawn.jar: build/EssentialsXSpawn.jar
	mkdir -p bin
	cp build/EssentialsXSpawn.jar bin/EssentialsXSpawn.jar

build/EssentialsXSpawn.jar:
	mkdir -p build
	curl "https://ci.drtshock.net/job/EssentialsXSpawn/lastBuild/artifact/Essentials/target/EssentialsXSpawn-2.0.1.jar" -z build/EssentialsXSpawn.jar -o build/EssentialsXSpawn.jar --verbose --silent --location

.PHONY: build/EssentialsXSpawn.jar
