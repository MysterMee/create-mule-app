
mkdir "$HOME/bin"
cp "$PWD/create-mule-app.sh" "$HOME/bin"

echo \ >> ~/.bash_profile
echo "alias create-mule-app=~/bin/create-mule-app.sh" >> ~/.bash_profile

mkdir "$HOME/bin/default-template"
cp -r "$PWD/default-template/." "$HOME/bin/default-template"

echo "Cloning template project to HOME successful."
echo "  Check out $HOME/bin/default-template/template-project "
echo "   if you would like to customize the default template project."
echo "  Otherwise, you can also create a new directory at $HOME/bin"
echo "   and utilize the [-t] flag to route for different templates."
echo \
echo "Press any key to close"
read
