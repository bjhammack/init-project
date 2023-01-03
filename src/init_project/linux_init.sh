#!/bin/bash
# Script to initialize Python project structure.

# Handle arguments
project_name=$1
use_git=$2
templates="~/programming/templates"

if [ -n "$project_name" ]; then
	project_name_clean=${project_name//-/_}
else
	echo "Script requires a project name."
	exit 1
fi

# Create folders
mkdir projects/${project_name} && cd $_
mkdir src
mkdir src/${project_name_clean}
mkdir tests

# Create empty files
touch requirements.txt
touch src/${project_name_clean}/__init__.py
touch tests/__init__.py

# Create template files
cp ../../templates/.gitignore.txt .gitignore
cp ../../templates/LICENSE.txt LICENSE
cp ../../templates/README.md.txt README.md
cp ../../templates/pyproject.toml.txt pyproject.toml
cp ../../templates/requirements_dev.txt requirements_dev.txt
cp ../../templates/setup.cfg.txt setup.cfg
cp ../../templates/setup.py.txt setup.py

# Add proper names to template files.
sed -i -e "s+\[PROJECT_NAME_CLEAN\]+${project_name_clean}+g" setup.cfg
sed -i -e "s+\[PROJECT_NAME\]+${project_name}+g" README.md
sed -i -e "s+\[PROJECT_NAME\]+${project_name}+g" setup.cfg

# Git check
if [ "$use_git" = "git" ]; then
	git init -b main
	git add -A && git commit -am "Initial commit."
	gh repo create ${project_name} --private --source=. --push
fi

