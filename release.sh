#!/bin/bash
sudo rm -rf jdeploy-bundle
version=`awk 'NF>1{print $NF}' version.properties`
echo "Version is: \"$version\""
rm -rf wiremock*jar
wget https://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/$version/wiremock-standalone-$version.jar
rm -rf package.json
cp package.json.orig package.json
sed -i "s/VERSION/$version/g" package.json
sudo jdeploy publish \
 && git tag $version \
 && git push --tags
