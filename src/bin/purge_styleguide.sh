#!/bin/bash
# Run this script in the root of the fronthack directory if you decide to not
# use a styleguide. It removes all it's stuff from the project.
# WARNING: Before doing that, make sure your gulpfile was not modified.

echo "Removing styleguide files"
rm -rf ./dist/styleguide
rm ./src/sass/styleguide-overrides.sass
rm -rf ./src/sass/base/html
rm -rf ./src/sass/components/html

echo "Removing styleguide generation tasks from Gulp"
sed -i 's/"gulp-watch": "~4.3.11",/"gulp-watch": "~4.3.11"/' package.json
sed -i "/sc5-styleguide/d" package.json

sed -i "/styleguide = require/d" gulpfile.js
sed -i "22,29d" gulpfile.js
sed -i "46,90d" gulpfile.js
sed -i "/    'styleguide',/d" gulpfile.js
sed -i "/    'images',/d" gulpfile.js
sed -i "/    'js',/d" gulpfile.js
sed -i "s/paths\.styleguide\.html, //g" gulpfile.js

echo "Done"
