# toolbox
Commands and stuff I use.

# Docker
remove all containers.
<code>docker rm $(docker ps -aq)</code>

set docker-machine environment.
<code>docker-machine env</code>

# Linux
unlock user account.
<code>pam_tally2 -r -u username</code>

check the exit code of the last command in a linux terminal.
<code>echo $?</code>

fork bomb (DANGER! DO NOT RUN THIS!)
<code>:(){ :|: & };:</code>

# Java
take java thread dump.
<java>jmap -dump:format=b,file=servername.hprof <pid></code>

# sed
creates a new line with "newtext" in the line above the matching pattern.  
<code>sed '/quartzSchedulerControl/inewtext' /path/to/file</code>

creates a new line with "newtext" 3 lines after the matching pattern.  
<code>sed '/quartzSchedulerControl/!{p;d;};n;n;n;a newtext' /path/to/file</code>
