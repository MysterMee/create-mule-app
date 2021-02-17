
if [ -z $1 ] | [ -z $2 ];
then
  echo 'create-mule-app requires two inputs, the destination path and the name of the new project.'
  echo 'For example: create-mule-app /C/Users/Admin/AnypointStudio/studio-workspace new-template-exp-api'
  exit 1
fi

templatePath=$PWD'/template-project/.'
newPath=$1'/'$2

# Create folder for new project
if [ -d $newPath ];
then
  echo "The given destination path already has a folder named $2."
  echo "Please provide a unique project name."
  exit 1
else
  mkdir $newPath

  # Copy all cotents of template-project to new location
  cp -r "$templatePath" "$newPath"
  cp "$PWD/.project" "$newPath"
  cp "$PWD/.classpath" "$newPath"

  # Replace the placeholder name to the parameter project name
  sed -i "s/create-mule-app-template/$2/g" "$newPath/pom.xml"
  sed -i "s/create-mule-app-template/$2/g" "$newPath/.project"
  sed -i "s/create-mule-app-template/$2/g" "$newPath/src/main/mule/global-configs.xml"
  sed -i "s/create-mule-app-template/$2/g" "$newPath/src/main/mule/template-api.xml"
  sed -i "s/create-mule-app-template/$2/g" "$newPath/src/test/munit/template-suite.xml"

  # Rename template files to parameter project name
  mv "$newPath/src/main/mule/template-api.xml" "$newPath/src/main/mule/$2.xml"
  mv "$newPath/src/test/munit/template-suite.xml" "$newPath/src/test/munit/$2-suite.xml"

  echo "Project $2 successfully created."
fi
