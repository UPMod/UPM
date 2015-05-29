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
**Download and automatically apply changes (with rebase in master by config)**
```sh
$ git pull
```
**Download and manually apply changes (in master)**
```sh
$ git fetch
$ git rebase origin/master
```
**Do commits (always in local)**
```sh
# All files with changes
$ git commit -am "#60: bla bla bla"
# Single folder/file
$ git add addons/groups/config.cpp
git commit -m "#14: bla bla bla"
```
**Show changes single commit**
```sh
$ git show dc094cb...
```
**Upload changes to server**
```sh
$ git push
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
# Default "git commit" unless says otherwise
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
## Workflow
