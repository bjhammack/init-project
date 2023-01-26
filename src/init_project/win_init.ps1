#!/bin/bash
# Script to initialize Python project structure.

# Handle arguments
$project_name=$args[0]
$init_repo=$args[1]
$project_path=$args[2]
$script_dir=$pwd.Path
Set-Location $project_path
$project_dir=$pwd.Path
Set-Location $script_dir

if($project_name -eq "help"){
    Write-Host "win_init.ps1 project_name init_repo dir_loc"
    exit 1
}

if($project_name.Length -gt 0){
    $project_name_clean = $project_name -replace "-", "_"
}
else{
    Write-Host "Script requires a project name as first argument."
    exit 1
}

# Create folders
mkdir $project_dir/$project_name
mkdir $project_dir/$project_name/src
mkdir $project_dir/$project_name/src/$project_name_clean
mkdir $project_dir/$project_name/tests

# Create empty files
Out-File -FilePath $project_dir/$project_name/requirements.txt
Out-File -FilePath $project_dir/$project_name/src/$project_name_clean/__init__.py
Out-File -FilePath $project_dir/$project_name/tests/__init__.py

# Copy template files to project
Copy-Item $script_dir/templates/.gitignore.txt -Destination $project_dir/$project_name/.gitignore
Copy-Item $script_dir/templates/LICENSE.txt -Destination $project_dir/$project_name/LICENSE.txt
Copy-Item $script_dir/templates/README.md.txt -Destination $project_dir/$project_name/README.md
Copy-Item $script_dir/templates/pyproject.toml.txt -Destination $project_dir/$project_name/pyproject.toml
Copy-Item $script_dir/templates/requirements_dev.txt -Destination $project_dir/$project_name/requirements_dev.txt
Copy-Item $script_dir/templates/setup.cfg.txt -Destination $project_dir/$project_name/setup.cfg
Copy-Item $script_dir/templates/setup.py.txt -Destination $project_dir/$project_name/setup.py

# Replace template text in files
(Get-Content $project_dir/$project_name/setup.cfg).Replace("[PROJECT_NAME_CLEAN]",$project_name_clean) | Set-Content $project_dir/$project_name/setup.cfg
(Get-Content $project_dir/$project_name/setup.cfg).Replace("[PROJECT_NAME]",$project_name) | Set-Content $project_dir/$project_name/setup.cfg
(Get-Content $project_dir/$project_name/README.md).Replace("[PROJECT_NAME]",$project_name) | Set-Content $project_dir/$project_name/README.md

if($init_repo -eq "true"){
    Set-Location $project_dir/$project_name
    git init -b main
    git add -A
    git commit -am "Initial commit."
    gh repo create $project_name --private --source=. --push
}