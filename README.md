# linux-desktop-entry
A simple Bash script to create desktop entry for applicaiton in Linux environment. Please keep in mind that this script does not escalate privileges to run application. To run application from desktop entry with sudo privileges, you might need to use 'pkexec' or make an entry in the '/etc/sudoers' file with specific Username and Executable file path.

There are two script files in the repository. Both files functunality is similar but input methods are different.

_**desktop_entry_arg.sh**_: It takes Command line arguments. Syntax is:

    bash desktop_entry_arg.sh <set-entry-name> <executable-file-absolute-path> <favicon-file-absolute-path>

_**desktop_entry_inp.sh**_: It takes user inputs. Syntax is:

    bash desktop_entry_inp.sh
    
Provide input as required by the script.

After script executed successfully, search for newly created desktop entry by using 'windows' or 'super' key.

For help, use '-h' or '--help' with the script file:

    bash desktop_entry_arg.sh --help

    bash desktop_entry_inp.sh --help

**This script does not let you run desktop entry application with sudo privileges**
