# timestamps
Use timestamp files for tracking state or progress

## Motivation

Sometimes you need a simple way for processes to hand off simple
information or flags between cooperating processes

* Is daily system housekeeping running, or complete?
** Monitoring tools can look for timestamp flag files and alert
   if something failed, or has taken too long
* Is a process or task allowed to run?  Or has someone or something
  set a flag to indicate that it should not be run?
** We use a timestamp file to say whether or not puppet is allowed to run
** We use timestamp files to indicate that database replication should
   be stopped (during maintenance), and implement a simple "lockout/tagout"
   system so that multiple people can turn off replication, and it won't
   be turned back on until the last person agrees.
* Has a periodic task completed correctly recently?
** A cron job can update a timestamp file when it completes, a
   monitoring system can alert if the task hasn't completed
   successfully within a reaonable time period.  e.g. Some number
   of failures are acceptable, but consistent failures are not.


## How It Works

The *timestamp* command manipulates files in known directories in /tmp.
There are option flags to create, query, and remove timestamp files.
Thus providing a very simple, primitive way of communicating via
flag files, in a standardized fashion.

Dead simple, but we think it's handy.


## What's missing?

It would be nice to be able to compare to the time a timestamp was
set, using the *timestamp* command itself.  Currently, we use things
like the check_file_age monitoring plugin.
