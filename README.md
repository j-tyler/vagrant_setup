<img src="https://www.holbertonschool.com/assets/holberton-logo-1cc451260ca3cd297def53f2250a9794810667c7ca7b5fa5879a569a457bf16f.png" alt="Holberton logo">

## Save, Sync, and Configure your Vagrant across the network

### What does this script do?
This script links your school network drive to your vagrant box.
Every time you log into your vagrant box via this script, your
files from the network will sync to your vagrant box and be available.
On logout, your files will sync back to the network drive.

This means you can have a persistent environment across all iMacs!

#### Exactly what happens:  
1) Directory ~/network_drive is created.  
2) Your network folder is mounted (linked) to ~/network_drive  
3) Your Github is searched for a fork of this vagrant_setup repo.  
4) If it is found, it clones it to ~/vagrant_setup, else it clones the main branch.  
5) File ~/vagrant_setup/1-VagrantSetup is executed creating a VagrantFile  
6) The box is launched, syncing your files from ~/network_drive into vagrant home folder.  
7) You are ssh'ed into your box.  
...  
8) On exit from your box, your files are synced back onto the network folder.

### Script setup:
1) Fork the repository to your github.  

2) Edit 2-RunOnProvision to add any new commands you'd like executed when 
   you enter your box. This will be your vagrant environment.

3) Execute the script on your local machine.  
A copy of the execution script is on your iMac, in the home folder.

### Usage:
```
./StudentEnv.sh <GITHUB USERNAME>
```

If you give your github username as the first argument, your the script
will search your github for a personalized copy. This lets you edit the
script to make your programming environment exactly as you wish.

### Directories Created:
This script will create the following directories:

1) ~/network_drive - This is a copy of the contents of your network drive

2) ~/vagrant_synced - This is your vagrant box that is synced to your network drive


### Future Features:
It is possible to mirror your laptop settings across the network as well. This script currently doesn't handle this, but maybe soon it will? :)



#### Contribute:
Found something neat? Think you can improve the system?

Fork the repository and send a pull requests. We are always open to ideas!

Maintained by:

*Justin Marsh* - [Github](https://github.com/j-tyler) || [Twitter](https://twitter.com/dogonthecircuit)

*Tim Britton* - [Github](https://github.com/wintermanc3r) || [Twitter](https://twitter.com/wintermanc3r)
