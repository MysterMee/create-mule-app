
templatePath=$PWD'/template-project/.'
newPath=$1'/'$2

# Create folder for new project
mkdir $newPath

# Copy all cotents of template-project to new location
cp -r "$templatePath" "$newPath"

# Replace the placeholder name to the parameter project name
sed -i "s/create-mule-app-template/$2/g" "$newPath/pom.xml"
sed -i "s/create-mule-app-template/$2/g" "$newPath/src/main/mule/global-configs.xml"
sed -i "s/create-mule-app-template/$2/g" "$newPath/src/main/mule/template-api.xml"
sed -i "s/create-mule-app-template/$2/g" "$newPath/src/test/munit/template-suite.xml"

# Rename template files to parameter project name
mv "$newPath/src/main/mule/template-api.xml" "$newPath/src/main/mule/$2.xml"
mv "$newPath/src/test/munit/template-suite.xml" "$newPath/src/test/munit/$2-suite.xml"
