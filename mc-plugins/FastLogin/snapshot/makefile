
all: bin/FastLogin.jar

bin/FastLogin.jar: build/FastLogin.jar
	mkdir -p bin
	cp build/FastLogin.jar bin/FastLogin.jar

build/FastLogin.jar:
	mkdir -p build
	curl "http://ci.xephi.fr/view/AuthMe%20Plugins/job/FastLogin/lastSuccessfulBuild/artifact/universal/target/FastLogin.jar" -z build/FastLogin.jar -o build/FastLogin.jar --verbose --silent --location

.PHONY: build/FastLogin.jar
