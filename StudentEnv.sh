#!/bin/bash
## Mounting Script for connecting to the Network_Drive
###
###
## Create folder if it doesn't exist
###
user="$(whoami)"

if [ ! -d /Users/"$user"/network_drive ]; then
    mkdir /Users/"$user"/network_drive
fi

###
## Attempt to mount drive multiple times
###
for i in {0..100}
do
    echo "Mounting network drive to /Users/$user/network_drive..."
    mount -t smbfs smb://srv008/Students/"$user" /Users/"$user"/network_drive
    if [ `echo $?` -eq 0 ]; then
        break
    fi
    mount -t smbfs smb://srv008/Students/"$user" /Users/"$user"/network_drive
    if [ `echo $?` -eq 64 ]; then
        echo "####################################################"
        echo "File exists is OK! That means your drive is mounted."
        echo "####################################################"
        break
    fi
    echo "Sometimes the network doesn't work (._.)"
    echo "Try restarting or use another mac? ¯\_(ツ)_/¯"
    echo "If you need to use this specific machine, just run:"
    echo "./1-VagrantSetup && vagrant up && vagrant ssh"
    echo "FAIR WARINING: your files will not correctly sync!"
    sleep 10
done

###
## Remove vagrant_synced folder and pull new copy
###
rm -rf /Users/"$user"/vagrant_synced

###
## Pull a fresh copy either from USER specified, or from master branch
###
git clone https://anon:anon@github.com/$1/vagrant_setup /Users/"$user"/vagrant_synced 2> /dev/null ||
{ echo "################################################" &&
echo "Github username not given, cloning a basic copy" &&
echo "Usage: ./launch_vagrant <GITHUB USERNAME>" &&
echo "################################################" &&
git clone https://anon:anon@github.com/j-tyler/vagrant_setup /Users/"$user"/vagrant_synced 2> /dev/null; }

/Users/"$user"/vagrant_synced/1-VagrantSetup
export VAGRANT_CWD=/Users/"$user"/vagrant_synced/
vagrant provision && vagrant up && vagrant ssh
