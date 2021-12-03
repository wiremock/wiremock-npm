#!/bin/bash

version=$(node -p -e "require('./package.json').version")
echo releasing $version

rm -rf build \
 && mkdir build \
 && wget –q https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$version/wiremock-jre8-standalone-$version.jar \
    -P build \
 && ls -hs build/wiremock*.jar || (echo "does not exist" && exit 1)

#npm version prerelease --preid=alpha
rm -f package-lock.json
npm install \
 && npm publish \
 && git tag $version \
 && git push -u origin --tags
