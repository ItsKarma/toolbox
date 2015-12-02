# toolbox
Commands and stuff I use.

# Docker
remove all containers.  
```docker rm $(docker ps -aq)```

set docker-machine environment.  
```docker-machine env```

# Vagrant
After updating vagrant you should also update the guest additions
You can find them here: http://download.virtualbox.org/virtualbox/
``` bash
wget http://download.virtualbox.org/virtualbox/5.0.4/VBoxGuestAdditions_5.0.4.iso
sudo mv VBoxGuestAdditions_5.0.4.iso /Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
```

# Linux
generate epoch.  
```date +%s```

convert epoch to human readable time.
``` bash
# where 11111111 is your epoch
date -d @11111111
```  

start a screen.  
```screen -s screen_name```  
detach from a screen.  
```ctrl+a d```  
show running screens.  
```screen -r```  
reattach to a running screen.  
```screen -r screen_name```  

unlock user account.  
```pam_tally2 -r -u username```  

check the exit code of the last command in a linux terminal.  
```echo $?```  

fork bomb (DANGER! DO NOT RUN THIS! - it will crash your system)  
```:(){ :|: & };:```

ps1 generator  
https://www.kirsle.net/wizards/ps1.html

# Networking
tcpdump listen for all traffic on port 5000
```tcpdump -i eth0 port 5000```

tcpdump listen for all traffic from a specific source on port 80
```tcpdump -i eth0 src 192.168.1.100 and port 8011```

# Java
take java thread dump.  
```jmap -dump:format=b,file=$(hostname).hprof <pid>```

# sed
creates a new line with "newtext" in the line above the matching pattern.  
```sed '/quartzSchedulerControl/inewtext' /path/to/file```

creates a new line with "newtext" 3 lines after the matching pattern.  
```sed '/quartzSchedulerControl/!{p;d;};n;n;n;a newtext' /path/to/file```

# LVM
<b>Physical Volume</b>  
create the physical volume(s)  
```pvcreate /dev/xvdf```

show the attributes of the physical volume(s)  
<code>pvdisplay</code>

<b>Volume Group</b>  
creates volume group called “data” using the physical volume(s) shown  
<code>vgcreate data /dev/xvdf</code>

show attributes of “data” volume group  
<code>vgdisplay</code>

show attributes of “data” volume group  
<code>vgdisplay -s</code>

scan physical volumes  
<code>vgscan</code>

<b>Logical Volume</b>  
create the logical volume named “data” from the “data” volume group  
<code>lvcreate --name data --size 99G data (leave 1% out)</code>

show attributes of the logical volume(s)  
<code>lvdisplay</code>

show attributes of the logical volume(s)  
<code>lvdisplay -C</code>

show attributes of the logical volume(s)  
<code>lvscan</code>

<b>Create Filesystem</b>  
create ext4 filesystem on logical volume(s)  
<code>mkfs.ext4 /dev/data/data</code>

create mount point(s)  
<code>mkdir -p /data</code>

mount logical volume(s)  
<code>mount /dev/data/data /data/log</code>

check!  
<code>df -h</code>

<b>Add Logical Volumes to /etc/fstab</b>  
add logical volume(s) to /etc/fstab so they are mounted automatically on reboot  
<code>echo "/dev/data/data /data ext4 defaults 0 0" >> /etc/fstab</code>

# Git  
undo stuff  
https://github.com/blog/2019-how-to-undo-almost-anything-with-git  

pretty format  
```git log -1 --pretty=format:"%nCommit: %H%nAuthor: %an%nDate: %ad%nTag: %d%nSubject: %s%n%n"```  

# Postgres  
list databases  
<code>\l</code>  

switch databases  
<code>\connect database_name</code>  

list all tables in current database  
<code>\dt</code>  

quit / log out  
<code>\q</code>  

# SQL
show max connections  
<code>show max_connections;</code>  

# Dev Tool Links
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
Requestdiff - http://requestdiff.com/ - diff's http requests  
Google Power User - http://i.imgur.com/qmsBvjC.jpg - image of how to use google  
rss bot (mac osx) - https://itunes.apple.com/us/app/rss-bot-news-notifier/id605732865  

# Fun Stuff
Daniel H.C. Peterson aka dhcp  
Bastard Operator From Hell aka BOFH - http://bofh.ntk.net/BOFH/  
ya blew it gif - https://media.giphy.com/media/fpdql5AgW7ziM/giphy.gif  
I don't always test my code - https://i.imgur.com/y7Hm9.jpg  
99 problems 0 bitches - https://i.imgur.com/xlQZbYE.jpg  
99 little bugs in the code - https://i.imgur.com/HTisMpC.jpg  
John Cena SS - http://i.imgur.com/17djyaF.gifv  
