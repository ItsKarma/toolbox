# toolbox
Commands and stuff I use.

# sed
creates a new line with "newtext" in the line above the matching pattern.  
<code>sed '/quartzSchedulerControl/inewtext' /path/to/file</code>

creates a new line with "newtext" 3 lines after the matching pattern.  
<code>sed '/quartzSchedulerControl/!{p;d;};n;n;n;a newtext' /path/to/file</code>
