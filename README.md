# toolbox
Commands and stuff I use.

# Docker
remove all containers.  
``docker rm $(docker ps -aq)``

set docker-machine environment.  
``docker-machine env``

# Vagrant
After updating vagrant you should also update the guest additions
You can find them here: http://download.virtualbox.org/virtualbox/
``` bash
wget http://download.virtualbox.org/virtualbox/5.0.4/VBoxGuestAdditions_5.0.4.iso
sudo mv VBoxGuestAdditions_5.0.4.iso /Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
```

# Linux
generate epoch.  
``date +%s``

convert epoch to human readable time.
``` bash
# where 11111111 is your epoch
date -d @11111111
```  

start a screen.  
``screen -s screen_name``  
detach from a screen.  
``ctrl+a d``  
show running screens.  
``screen -r``  
reattach to a running screen.  
``screen -r screen_name``  

unlock user account.  
``pam_tally2 -r -u username``  

check the exit code of the last command in a linux terminal.  
``echo $?``  

fork bomb (DANGER! DO NOT RUN THIS! - it will crash your system)  
``:(){ :|: & };:``  

debug core dumps.  
``gdb -c core.xxxx``  
backtrace  
``(gdb) bt``  
list instructions/code
``(gdb) list``  

find files that were most recently modified.  
``find . -type f | xargs stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head``  

ps1 generator  
https://www.kirsle.net/wizards/ps1.html  

# Networking
tcpdump listen for all traffic on port 5000  
``tcpdump -i eth0 port 5000``  

tcpdump listen for all traffic from a specific source on port 80  
``tcpdump -i eth0 src 192.168.1.100 and port 80`` 

tcpdump listen for all traffic on port 80 and write to file to view later in wireshark  
``tcpdump -i eth0 src 192.168.1.100 and port 80 -w /tmp/server.pcap``  

read pcap tcpdump file  
``tcpdump -r /tmp/server.pcap``  

# Java  
take java thread dump.  
``jmap -dump:format=b,file=$(hostname).hprof <pid>``  
``kill -3 <pid>``  

# PHP  
adjusting php children  
http://myshell.co.uk/blog/2012/07/adjusting-child-processes-for-php-fpm-nginx/  


# sed  
creates a new line with "newtext" in the line above the matching pattern.  
``sed '/quartzSchedulerControl/inewtext' /path/to/file``  

creates a new line with "newtext" 3 lines after the matching pattern.  
``sed '/quartzSchedulerControl/!{p;d;};n;n;n;a newtext' /path/to/file``  

# LVM  
<b>Physical Volume</b>  
create the physical volume(s)  
``pvcreate /dev/xvdf``  

show the attributes of the physical volume(s)  
``pvdisplay``  

<b>Volume Group</b>  
creates volume group called “data” using the physical volume(s) shown  
``vgcreate data /dev/xvdf``  

show attributes of “data” volume group  
``vgdisplay``  

show attributes of “data” volume group  
``vgdisplay -s``  

scan physical volumes  
``vgscan``  

<b>Logical Volume</b>  
create the logical volume named “data” from the “data” volume group  
``lvcreate --name data --size 99G data (leave 1% out)``  

show attributes of the logical volume(s)  
``lvdisplay``  

show attributes of the logical volume(s)  
``lvdisplay -C``  

show attributes of the logical volume(s)  
``lvscan``  

<b>Create Filesystem</b>  
create ext4 filesystem on logical volume(s)  
``mkfs.ext4 /dev/data/data``

create mount point(s)  
``mkdir -p /data``

mount logical volume(s)  
``mount /dev/data/data /data/log``

check!  
``df -h``

<b>Add Logical Volumes to /etc/fstab</b>  
add logical volume(s) to /etc/fstab so they are mounted automatically on reboot  
``echo "/dev/data/data /data ext4 defaults 0 0" >> /etc/fstab``

# Git  
undo stuff  
https://github.com/blog/2019-how-to-undo-almost-anything-with-git  

pretty format  
``git log -1 --pretty=format:"%nCommit: %H%nAuthor: %an%nDate: %ad%nTag: %d%nSubject: %s%n%n"``  

# Postgres  
list databases  
``\l``  

switch databases  
``\connect database_name``   

list all tables in current database  
``\dt``  

quit / log out  
``\q``    

# SQL
show max connections  
``show max_connections;``  

# Dev Tool Links
Homebrew - brew.sh
RescueTime - https://www.rescuetime.com - tracks your time and productivity  
Atom - http://atom.io - desktop editor (plugins: vim mode, markdown, minimap, git diff)  
Mou - http://25.io/mou/ - markdown editor (now I use the markdown plugin for atom)  
shiftit (mac osx) - https://github.com/fikovnik/ShiftIt - window shifting manager  
Evernote - https://evernote.com/ - note taking  
KeePassX - https://www.keepassx.org/ - encrypted password manager  
Virtualbox - https://www.virtualbox.org/ - virtual machines  
Docker - https://www.docker.com/ - containers  
Jenkins - https://jenkins-ci.org/ - automation  
Chef - https://www.chef.io/ - configuration management  
Packer - https://packer.io/ - image management  
terraform - https://www.terraform.io/ - infrastructure as code  
Requestdiff - http://requestdiff.com/ - diff's http requests  
HTTP Statuses - https://httpstatuses.com/ - simple list of http status codes  
Google Power User - http://i.imgur.com/qmsBvjC.jpg - image of how to use google  
rss bot (mac osx) - https://itunes.apple.com/us/app/rss-bot-news-notifier/id605732865  
EC2 Instances http://www.ec2instances.info/  
Disk Inventory X - http://www.derlien.com/ - graphical way to visualize disk space on your mac  
saws - https://github.com/donnemartin/saws - A supercharged AWS command line interface

# Fun Stuff
Daniel H.C. Peterson aka dhcp  
Bastard Operator From Hell aka BOFH - http://bofh.ntk.net/BOFH/  
ya blew it gif - https://media.giphy.com/media/fpdql5AgW7ziM/giphy.gif  
I don't always test my code - https://i.imgur.com/y7Hm9.jpg  
99 problems 0 bitches - https://i.imgur.com/xlQZbYE.jpg  
99 little bugs in the code - https://i.imgur.com/HTisMpC.jpg  
John Cena SS - http://i.imgur.com/17djyaF.gifv  
