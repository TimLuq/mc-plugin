## External repositories

Here you may add any external repositories you may wich to use.

Just add a file with the name of the repository with the extension `.url`.
The contents of the file are the git repositories, such as `https://github.com/TimLuq/mc-plugin.git`, one per line.
The line may also include a branch  after a whitespace, with the default being `master`.
If it is to be included it may look like `https://github.com/TimLuq/mc-plugin.git mc-plugins`.
This may be useful if a plugin creator want to use their plugin git repository to also host mc-plugin makefiles.

The repositories must have a directory called `mc-plugins` at the root level to have any effect.
