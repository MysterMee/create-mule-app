
mkdir "$HOME/bin"
cp "$PWD/create-mule-app.sh" "$HOME/bin"

echo \ >> ~/.bash_profile
echo "alias create-mule-app=~/bin/create-mule-app.sh" >> ~/.bash_profile

mkdir "$HOME/bin/create-mule-app"
cp -r "$PWD/create-mule-app/." "$HOME/bin/create-mule-app"

echo "Cloning template project to HOME successful."
echo "  Check out $HOME/bin/create-mule-app/template-project "
echo "  if you would like to customize the template project."
echo \
echo "Press any key to close"
read
