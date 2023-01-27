# Initializing Python Projects

This repo's simple purpose is to provide me (and anyone else who might find this useful) a quick and easy way to initialize Python projects with the basic package, git, and documentation structure any public Python project should have.

This is by no means the only or even necessarily the best way to setup a Python project. But it is widely accepted, recognized, and a good starting point for a smaller project.

For reference, this project itself (despite not being a Python project) was initialized using these scripts, so anyone can quickly see what sort of project structure it creates.

# Running

To run this initializer yourself, clone the project and navigate to [src/init_project/](src/init_project/). Here there are two scripts:
1. linux_init.sh -- A bash script that can init your project on linux.
    - This may work on mac too, but it is untested.
    - Note: there are still some hard-coded aspects in this script that will need to be addressed depending on how you organize your projects locally.
2. win_init.ps1 -- A powershell script that completes the same process as the bash script, but with no hardcoding.

Both these scripts create all the files found in [template](src/init_project/templates/), plus a blank requirements.txt file, and some \__init__.py files.

**NOTE:** since this repo was made mainly for my own purposes, there are some hardcoded references to me in some of the templates (particularly in [setup.cfg.txt](src/init_project/templates/setup.cfg.txt)). Consider removing/changing those, so that your projects are more personalized. Unless of course you want to ghost write a project for me, in which case, thank you.

## Bash Script
For the bash script, the assumption is that you are in the directory **above** a directory called "projects", that houses all your projects. Running the script from there with the arguments `project_name` (your project's name) and `use_git` ("git" if you want to initialize a git repo too) will properly execute your script and generate your project.

## Powershell Script
For this script you can be in any directory to run. Run with the positional arguments: `project_name` (same as above), `init_repo` ("true" if you want to initialize a git repo, otherwise "false"), and `project_path` (either the absolute or relative path to your project from your CWD).
