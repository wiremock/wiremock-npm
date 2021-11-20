#!/bin/bash
sudo rm -rf jdeploy-bundle
version=`awk 'NF>1{print $NF}' version.properties`
echo "Version is: \"$version\""
rm -rf wiremock*jar
wget –q https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-jre8-standalone/$version/wiremock-jre8-standalone-$version.jar
ls -hs wiremock-jre8-standalone-$version.jar || (echo "does not exist" && exit 1)
rm -rf package.json
cp package.json.orig package.json
sed -i "s/VERSION/$version/g" package.json
npm install \
 && npm publish \
 && git tag $version \
 && git push -u origin --tags
