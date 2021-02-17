
if [ -z $1 ] | [ -z $2 ];
then
  echo 'create-mule-app requires two inputs:'
  echo '  1.) The name of the new project,'
  echo '  2.) The groupId for the pom file.'
  echo '    For example: create-mule-app new-template-exp-api com.mycompany'
  exit 1
fi

templatePath="$HOME/bin/create-mule-app"
newPath=$PWD'/'$1

# Create folder for new project
if [ -d $newPath ];
then
  echo "The given destination path already has a folder named $1."
  echo "Please provide a unique project name."
  exit 1
else
  mkdir $newPath

  # Copy all cotents of template-project to new location
  cp -r "$templatePath/template-project/." "$newPath"
  cp "$templatePath/.project" "$newPath"
  cp "$templatePath/.classpath" "$newPath"

  # Replace the placeholders to parameters
  sed -i "s/create-mule-app-template/$1/g" "$newPath/pom.xml"
  sed -i "s/create-mule-app-template/$1/g" "$newPath/.project"
  sed -i "s/create-mule-app-template/$1/g" "$newPath/src/main/mule/global-configs.xml"
  sed -i "s/create-mule-app-template/$1/g" "$newPath/src/main/mule/template-api.xml"
  sed -i "s/create-mule-app-template/$1/g" "$newPath/src/test/munit/template-suite.xml"
  sed -i "s/com.mycompany/$2/g" "$newPath/pom.xml"

  # Rename template files to parameter project name
  mv "$newPath/src/main/mule/template-api.xml" "$newPath/src/main/mule/$1.xml"
  mv "$newPath/src/test/munit/template-suite.xml" "$newPath/src/test/munit/$1-suite.xml"

  echo \
  echo "Project $1 successfully created."
  echo "  Check out $HOME/bin/create-mule-app/template-project "
  echo "  if you would like to customize the template project."
fi
