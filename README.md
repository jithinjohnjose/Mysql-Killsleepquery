# What is MYSQL sleep query?

When a database connection is created, a session is also created on the database server simultaneously, but if that connection and session is not closed properly, then the query goes into sleep mode after the wait time gets over. As per MySQL reference manual, “Sleep is the thread waiting for the client to send a new statement to it”.So, sleep query is the query that waits for the timeout to terminate. That means query which takes time to execute and terminate goes in the sleep status.

sleep query in MySQL database 
Effects of a large number of MYSQL query – sleep :

* Increased consumption of CPU and memory resources (RAM, cache and processor).
* Slowing down of server.
* Increased downtime for websites -hackers try to slow website using sleep SQL injections

# Why MySQL Sleep Processes take place?

Connections waiting for a new MYSQL query, better known as the sleep processes, occur if in coding persistent connection to the database is used or if the database connection is not closed properly.

So, you get connections in the sleep state when a PHP script connects to MySQL, queries are executed and the connection is left open without disconnecting from the server.

Until the thread dies, any pre-thread buffers will be kept in the memory for 28,800 seconds in MySQL by default.
So, when many PHP processes stay connected without doing anything on the database, you end up with many processes in the sleep state.

How to overcome these issues?
To overcome this issue of SQL sleep command , MySQL uses two parameters:

interactive_ timeout and wait_ timeout.

These require certain values to be set to help query run up to that set time.

By default, both the parameters have set value as 28800 seconds (i.e. 8 hours).

To set these parameters in MySQL without restarting it, run below two commands in its terminal:

SET GLOBAL interactive_ timeout = 180;
SET GLOBAL wait_ timeout = 180;

You need to add these parameters in my.cnf file of MySQL under mysqld section, so that they can take effect after restarting the database server.

Also, at every script’s end, add mysql_ close() function so as to close the connection to the database once the query is done.

If you have the root access to your server, use the following command to edit my.cnf:

  $Locate my.cnf

It will show the location of MySQL configuration file, then use the following command to edit my.cnf:
$vi /etc/my.cnf

And add this line in my.cnf:

  wait_timeout = 60

where time is in seconds.

Thus, the connections will automatically close after waiting for 60 seconds.
