aspects_monit
========

Install and configure the monit monitoring utility.

Requirements
------------

Set ```hash_behaviour=merge``` in your ansible.cfg file.

Role Variables
--------------

See the template file for how these are used. 
aspects_monit_check_interval
aspects_monit_start_delay
aspects_monit_logfile
aspects_monit_idfile
aspects_monit_statefile
aspects_monit_mailserver
aspects_monit_eventqueue
aspects_monit_mmonit
aspects_monit_mail_format
aspects_monit_alert_recipients
aspects_monit_web_server
aspects_monit_remote_probes
aspects_monit_local_probes

Example Playbook
-------------------------

TODO: Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT