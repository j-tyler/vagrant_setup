<img src="https://www.holbertonschool.com/assets/holberton-logo-1cc451260ca3cd297def53f2250a9794810667c7ca7b5fa5879a569a457bf16f.png" alt="Holberton logo">

### Save, Sync, and Configure your Vagrant across the network

#### What does this script do?
This script links your school network drive to your vagrant box.
Every time you log into your vagrant box via this script, your
files from the network will sync to your vagrant box and be available.
On logout, your files will sync back to the network drive.

This means you can have a persistent enviornement across all iMacs!

#### Setup:
1) Fork the repository to your github.

2) Edit 2-RunOnProvision to add any new commands you'd like executed when you enter your box.

3) Execute the script on your local machine.

#### Usage:
```
./StudentEnv.sh <GITHUB USERNAME>
```

If you give your github username as the first argument, your the script
will search your github for a personalized copy. This lets you set the
script to make your programming environment exactly as you wish.

In total, it will mount your network drive, set up network syncing,
load your vagrant and ssh in.  Magic!

#### Contribute:
Found something neat? Think you can improve the system?

Fork the repository and send a pull requests. We are always open to ideas!

Maintained by:

*Justin Marsh* - [Github](https://github.com/j-tyler) || [Twitter](https://twitter.com/dogonthecircuit)

*Tim Britton* - [Github](https://github.com/wintermanc3r) || [Twitter](https://twitter.com/wintermanc3r)
