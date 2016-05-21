
all: bin/AuthMeReloaded.jar

bin/AuthMeReloaded.jar: build/AuthMeReloaded.jar
	mkdir -p bin
	cp build/AuthMeReloaded.jar bin/AuthMeReloaded.jar

build/AuthMeReloaded.jar:
	mkdir -p build
	curl "http://ci.xephi.fr/job/AuthMeReloaded/lastSuccessfulBuild/artifact/target/AuthMe-5.2-SNAPSHOT-spigot.jar" -z build/AuthMeReloaded.jar -o build/AuthMeReloaded.jar --verbose --silent --location

.PHONY: build/AuthMeReloaded.jar
