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
$ git config --global user.email "YOUR EMAIL ADDRESS"
```
**Global settings**
```sh
$ git config --global color.ui true
$ git config --global core.mergeoptions --no-edit
$ git config --global push.default simple
$ git config --global credential.helper wincred
```
## Workflow

## Help commands
