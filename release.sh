#!/bin/bash

version=$(node -p -e "require('./package.json').version")
echo releasing $version

rm -rf build \
 && mkdir build \
 && wget –q https://repo1.maven.org/maven2/org/wiremock/wiremock-standalone/$version/wiremock-standalone-$version.jar -P build

FILE=build/wiremock-standalone-$version.jar
if [ -f "$FILE" ]; then
 echo JAR downloaded ok
else
 echo JAR not downloaded ok
 exit
fi

#npm version prerelease --preid=alpha
rm -f package-lock.json || echo No package-lock.json
npm install \
 && npm publish \
 && git commit --allow-empty -a -m "releasing $version" \
 && git tag $version \
 && git push -u origin --tags \
 && git push
