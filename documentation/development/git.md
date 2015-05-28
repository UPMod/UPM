# Git

## Make repository for work
** Clone repository from GitHub **
```git
$ git clone https://github.com/upmod/UPM.git
```
** Configure hooks **
```git
$ cd .git/hooks
$ ln -s ../../tools/hooks/commit-msg commit-msg
$ chmod +x commit-msg
$ cd ../../
```
## Required configuration
** Name/nick and email address**
```git
$ git config --global user.name "YOUR NAME/NICKNAME"
$ git config --global user.email "YOUR EMAIL ADDRESS"
```
** Global settings **
```git
$ git config --global color.ui true
$ git config --global core.mergeoptions --no-edit
$ git config --global push.default simple
$ git config --global credential.helper wincred
```
** Force master to use rebase **
```git
$ git config branch.master.rebase true
```
## Workflow

## Help commands
