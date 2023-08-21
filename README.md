# linux-desktop-entry
A simple Bash script to create desktop entry for applicaiton in Linux environment.

There are two script files in the repository. Both files functunality is similar and require SUDO privileges to work.

_**desktop_entry_arg.sh**_: It takes Command line arguments. Syntax is:

    sudo bash desktop_entry_arg.sh <set-entry-name> <executable-file-absolute-path> <favicon-file-absolute-path> <system-username>

_**desktop_entry_inp.sh**_: It takes user inputs. Syntax is:

    sudo bash desktop_entry_inp.sh
    
Provide input as required by the script.

After script executed successfully, search for newly created desktop entry by using 'windows' or 'super' key.
