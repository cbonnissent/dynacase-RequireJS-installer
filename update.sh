#!/usr/bin/env bash

rm -rf ./bower_components/
bower install requirejs requirejs-text requirejs-i18n
PACKAGE_VERSION=$(bower info requirejs version | tail -n 1 | cut -d "'" -f 2)
cd ./bower_components
mkdir ./RequireJS/
cp ./requirejs/require.js ./RequireJS/
cp ./i18n/i18n.js ./RequireJS/
cp ./text/text.js ./RequireJS/
zip -r "../RequireJS-$PACKAGE_VERSION.zip" ./RequireJS
cd ..
scp "RequireJS-$PACKAGE_VERSION.zip" distrib@ftp.anakeen.com:/share/ftp/third-party/
echo $PACKAGE_VERSION > VERSION