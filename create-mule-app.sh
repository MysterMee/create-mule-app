
print_usage() {
  echo 'usage: create-mule-app [-h] [-g] [-n] [-t]'
  echo
  echo 'create-mule-app requires a value for [-g] and [-n] to succeed.'
  echo '  g) The groupId for the pom file.'
  echo '  n) The name of the new project,'
  echo '  t) Optionally define usage of any custom templates'
  echo '  h) Help flag'
}

print_help() {
  print_usage
  echo
  echo "This user has defined the following custom templates:"
  echo
  for d in "$HOME/bin/"*/ ; do
    echo "$d"
  done
  echo '  Where */default-template/ is used when [-t] is ommitted.'
  exit 1
}

clone_template() {
  # Create folder for new project
  if [ -d $newPath ];
  then
    echo "The given destination path already has a folder named $newName."
    echo "Please provide a unique project name."
    exit 1
  else
    mkdir $newPath

    # Copy all cotents of template-project to new location
    cp -r "$templateDir/template-project/." "$newPath"
    cp "$templateDir/.project" "$newPath"
    cp "$templateDir/.classpath" "$newPath"

    # Replace the placeholders to parameters
    sed -i "s/create-mule-app-template/$newName/g" "$newPath/pom.xml"
    sed -i "s/create-mule-app-template/$newName/g" "$newPath/.project"
    sed -i "s/create-mule-app-template/$newName/g" "$newPath/src/main/mule/global-configs.xml"
    sed -i "s/create-mule-app-template/$newName/g" "$newPath/src/main/mule/template-api.xml"
    sed -i "s/create-mule-app-template/$newName/g" "$newPath/src/test/munit/template-suite.xml"
    sed -i "s/com.mycompany/$groupId/g" "$newPath/pom.xml"

    # Rename template files to parameter project name
    mv "$newPath/src/main/mule/template-api.xml" "$newPath/src/main/mule/$newName.xml"
    mv "$newPath/src/test/munit/template-suite.xml" "$newPath/src/test/munit/$newName-suite.xml"

    echo
    echo "Project $newName successfully created."
    echo "  Path to the used template is at $templateDir"
    echo "  Take a look into its contents if you would like to customize the output."
  fi
}

groupId=''
newName=''
templateDir=''

while getopts 'hg:n:t:' flag; do
  case "${flag}" in
    h) print_help ;;
    g) groupId="${OPTARG}" ;;
    n) newName="${OPTARG}" ;;
    t) templateDir="${OPTARG}" ;;
    *) print_usage
      exit 1 ;;
  esac
done

if ! [ "$groupId" == '' ] | [ "$newName" == '' ] | [ "$templateDir" == '' ];
  then
    newPath="$PWD"'/'"$newName"
    templateDir="$HOME/bin/$templateDir"
    clone_template
  elif ! [ "$groupId" == '' ] | [ "$newName" == '' ];
  then
    newPath="$PWD"'/'"$newName"
    templateDir="$HOME/bin/default-template"
    clone_template
  else
    print_usage
    exit 1
fi
