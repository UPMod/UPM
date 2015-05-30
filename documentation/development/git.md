# Git

Guide and workflow

## Make repository for work
**Clone repository from GitHub**
```sh
$ git clone https://github.com/upmod/UPM.git
```
**Configure hooks**
```sh
$ cd .git/hooks
$ ln -s ../../tools/hooks/commit-msg commit-msg
$ chmod +x commit-msg
$ cd ../../
```
## Required configuration
**Name/nick and email address**
```sh
$ git config --global user.name "YOUR NAME/NICKNAME"
$ git config --global user.email "YOUR EMAIL ADDRESS(GITHUB)"
```
**Global settings**
```sh
$ git config --global color.ui true
$ git config --global core.mergeoptions --no-edit
$ git config --global push.default simple
$ git config --global credential.helper wincred
```
**Force master to use rebase (pulls). Simulate workflow SVN, all devs working on master**
```sh
$ git config branch.master.rebase true
```
## Commands

**Show status of working copy**
```sh
$ git status
```
**Branches**
```sh
# Show locals
$ git branch
# Show remotes
$ git branch -r
# Show all
$ git branch -a
# Show with extra info
$ git branch -avvv
# Show merged
$ git branch --merged
# Show without merged
$ git branch --no-merged
# Create branch and go (recommended)
$ git checkout -b name_of_branch
# Create branch 2 steps
$ git branch name_of_branch
$ git checkout name_of_branch
# Delete branch (normal)
$ git branch -d name_of_branch
# Delete branch (forced)
$ git branch -D name_of_branch
```
**Add files to repository/branch**
```sh
# Add single file
$ git add addons/groups/config.cpp
# Add all files
$ git add --all
```
**Do commits (always in local)**
```sh
# All files with changes
$ git commit -am "#60: bla bla bla"
# Single folder/file
$ git add addons/groups/config.cpp
$ git commit -m "#14: bla bla bla"
```
**Download and automatically apply changes (with rebase in master by config)**
```sh
$ git pull
```
**Upload changes to server**
```sh
$ git push
```
**Show changes single commit**
```sh
$ git show dc094cb...
```
**Upload branch to master**
```sh
$ git checkout master
$ git pull
$ git merge --no-ff bug#60
```
**Show diff between 2 branches or 2 commits**
```sh
$ git diff bug#60..master
```
**Resolve conflicts**
```sh
# 1.- Search all files with conflicts
# 2.- Find <<<<<<< HEAD or =====
# 3.- Edit
# 4.- Exec commands below 
$ git add addons/groups/config.cpp
# Default "git commit" unless "git status" says otherwise
$ git commit, git commit --continue or git rebase --continue
```
**History of changes**
```sh
# List all changes, show id of commit
$ git log --oneline
# Filter by text
$ git log --grep="#60" --oneline
# Filter by author
$ git log --author="oscarmolinadev" --oneline
```
**Download and manually apply changes (in master)**
```sh
$ git fetch
$ git rebase origin/master
```
**Reset**
```sh
# It is used to reset the local branch to another. To avoid problems, merges and rebases if the server is good
$ git fetch && git reset --hard origin/master
```
**Cherry Pick**
```sh
# Use in specific cases
# Apply a single commit
$ git cherry-pick dc094cb
```
**Patch**
```sh
# Alternative to Cherry Pick
# Apply big changes from commits
$ git diff 0da94be 59ff30c > my.patch git apply my.patch
```
## Workflow

**Start bug/request/experimental**
```sh
$ git checkout master
$ git pull
# Types ==================================================================
# ========================================================================
# Bugs
# For all types of bugs, name of branch: bug#number_of_issue 
$ git checkout -b bug#45
# Features
# For all types of features, name of branch: feature#number_of_issue
$ git checkout -b feature#730
# Experimental
# Other things, test, etc, name of branch: experimental#name_description
$ git checkout -b experimental#test_markers_of_debug
```
**Upload branch to GitHub**
```sh
# Bash file: check if branch already exist and push to GitHub
$ tools/deploy
```
**Upload changes to branch**
```sh
$ git commit -am "#40: bla bla bla"
$ git push
```
**Incorporate changes to master**
```sh
$ git checkout master
$ git pull
$ git merge --no-ff bug#40
$ git push
```
**Close bug/request/experimental**
```sh
# Option 1 from branch
$ git checkout bug#40
$ tools/delete-branch
# Option 2 from master
$ tools/delete-branch bug#40
```