
if [ ! -d "$HOME/bin" ];
then
  mkdir "$HOME/bin"
fi

echo
cp "$PWD/create-mule-app.sh" "$HOME/bin"
echo 'Successfully moved or replaced the main script file.'

cd ~

if grep -Rq 'alias create-mule-app=~/bin/create-mule-app.sh' .bash_profile
then
  echo 'Skipping bash profile edit, alias already exists.'
  echo
else
  echo \ >> ~/.bash_profile
  echo "alias create-mule-app=~/bin/create-mule-app.sh" >> ~/.bash_profile
fi

if [ -d "$HOME/bin/default-template" ];
then
  echo "Skipping template import, the $HOME/bin/default-template directory already exists."
  echo
else
  mkdir "$HOME/bin/default-template"
  cp -r "$PWD/default-template/." "$HOME/bin/default-template"
fi

echo "Setting up the script and alias was successful!"
echo
echo '  Try opening a bash console in any folder and typing in the following to get started:'
echo '    create-mule-app -h'
echo
echo "  Check out $HOME/bin/default-template/template-project "
echo '    if you would like to customize the default template project.'
echo "  Otherwise, you can also create a new directory at $HOME/bin"
echo '    and then utilize the [-t] flag to route for different templates.'
echo
echo "Press any key to close."
read
