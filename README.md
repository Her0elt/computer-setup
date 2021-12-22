# Computer setup

This repo contains script and config to easily setup a ubuntu machine for development

## Prerequisites

To preform all the installations and configurations we use [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Usage

### All install commands might need sudo aswell before the actual command

To preform a full installation you can use all

```
ansible-playbook local.yml
```
Or if you don't want to clone the repo you can run

```
ansible-pull -U https://github.com/her0elt/computer-setup.git
```

This will preform all the tasks included in the tasks folder

If you only want some of taks you can run use

```
ansible-playbook --tags [tag1, tag2] local.yml

eks:

ansible-playbook --tags "zsh,nvim" local.yml
```
This will run all tasks that are taged with the tags that you list for the example the tasks with zsh and nvim tags wil run

If you want to run every task except a few tasks you can use

```
ansible-playbook --skip-tags "zsh,nvim" local.yml
```

## Expanding

If you want to add tasks to the setup you can test your taks by using the docker image provided to create a clean ubuntu image which you can test your tasks in

To add a task to the setup simply create a new yml file in the tasks folder and include it in the include list in local.yml if your task uses tags also add the tag names in the tag list

Docker command
```
docker run --rm -it $(docker build -q .) bash
```

This command will open a shell into the ubuntu container where you can run

```
ansible-playbook -t <your-test-tag> local.yml

or

ansible-playbook --tags <your-test-tag> local.yml
```
