#!/bin/bash


git remote remove origin
git remote add origin https://$GH_TOKEN@github.com/tomasbjerre/wiremock-npm.git
git remote -v


cd release-automate
npm install
versionToRelease=`node release-automate.js`
if [ $? -eq 1 ]; then
 echo "No new release"
 exit
fi
cd ..
echo "version = $versionToRelease" > version.properties

git config user.email "tomas.bjerre85@gmail.com"
git config user.name "Tomas Bjerre"
git checkout master

./release.sh || exit 1

git commit -a -m "Bump version to $versionToRelease"
git push -u origin master

