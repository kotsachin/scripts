
==============README file for doing benchmark test using jdbcrunner-1.2===============

-------Setting envirinment variables to configure jdbcrunner---

export CLASSPATH=/usr/share/java/xalan-j2.jar:/home/sachin/jdbcrunner-1.2/jdbcrunner-1.2.jar

--export the path of xalan-j2.jar and jdbcrunner-1.2.jar files to work jdbcrunner properly.


-----benchmark.conf configuration parameters--------(all parameters are compulsary)------

NR -Number of repeatations/Runs      
WT -WarmupTime jdbcrunner configuration parameter      
MT -MeasurementTime jdbcrunner configuration parameter     
NA -Number of Agents/Clients     
SCL -Scale     
ST1 -SleepTime for Transaction-Type-1    
ST2 -SleepTime for Transaction-Type-2    
ST3 -SleepTime for Transaction-Type-3    
ST4 -SleepTime for Transaction-Type-4    
ST5 -SleepTime for Transaction-Type-5    

----To know more about this parameters read documentation of jdbcrunner-1.2---@---
http://hp.vector.co.jp/authors/VA052413/jdbcrunner/manual_ja/
https://github.com/sh2/jdbcrunner


BKP - Backup from which server(values:- master,standby-1,standby2,off)   
TT  Test Type (values:- Master-Only,SR,ncSR,cSR)



-------How to run benchmark script---------------------

sh run_test.sh

--run_test.sh -- This is the main benchmark script file to execute benchmark tests. 
--script/tpcc.js -- This is jdbcrunner java script file for tpcc benchmark specification inside script directory of jdbcrunner.





