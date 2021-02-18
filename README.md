
# create-mule-app

This is a simple bash script that clones a predefined template project to where the bash script is called. It will then replace placeholder values with an input name which results in a fresh new Mule project with the given name.

The template project is housed in ~/bin/create-mule-app and can be customized for different output.

This script does not automatically import RAML from the Design Center.

Utilize the following import steps within Anypoint Studio when incorporating a bunch of new projects at once to save time: [import projects -> General -> Existing Projects into Workspace]

### Install
Run install-alias.sh wherever you cloned this repo.
Note that current development supports Windows only.

### Future To-Do
- Need to resolve issue about transferring json-logger library
- install script prechecks. Its possible run this multiple times and crowd the bash_profile with duplicate alias
- Anypoint CLI driven Downloads with Design Center
	- However this would probably need automated ~/.anypoint/credentials setup
