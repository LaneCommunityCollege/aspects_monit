# aspects_monit

Install and configure the monit monitoring utility.

## Notice

aspects_monit uses package repositories when possible. Updating to the latest version of monit is done by copying the latest monit excutable over the installed version.

This means that if you want to keep using the old way of installing it in /opt/monit, or you use a non-RedHat or non-Debian distro, you will need to set these new variables:

* ```aspects_monit_run_manual_install```
* ```aspects_monit_use_manual_tasks```

# Requirements

Set ```hash_behaviour=merge``` in your ansible.cfg file.

# Role Variables

See the template file for how these are used.
* ```aspects_monit_check_interval```
* ```aspects_monit_start_delay```
* ```aspects_monit_logfile```
* ```aspects_monit_idfile```
* ```aspects_monit_statefile```
* ```aspects_monit_mailserver```
* ```aspects_monit_eventqueue```
* ```aspects_monit_mmonit```
* ```aspects_monit_mail_format```
* ```aspects_monit_alert_recipients```
* ```aspects_monit_web_server```
* ```aspects_monit_remote_probes```
* ```aspects_monit_local_probes```

If you need to test ldap servers, a very basic bind script can be generated by the ldaptest.sh.j2 template.

Set ```aspects_monit_use_ldap_test: True``` to install it.

Look at the template to see how the variables are used.

# Example Playbook

## host_vars/vm.redhat.lab
```yaml
    ---
    # Configure Monit
    aspects_monit_enabled: True
    aspects_monit_run_install: True
    aspects_monit_run_update: True
    aspects_monit_update_excutable_relative_path: files/monit/bin/monit
    aspects_monit_update_excutable_destination: /usr/bin/monit
    aspects_monit_mmonit: ""
    #aspects_monit_mmonit: "set mmonit http://mmonit/collector"
    aspects_monit_check_interval: "60"
    aspects_monit_logfile: "syslog facility log_daemon"
    aspects_monit_mailserver: "localhost"
    aspects_monit_alert_recipients:
      reagand: "you@example.tld"
    aspects_monit_web_server: |
      set httpd
        port 2812
        use address {{ ansible_fqdn }}
        allow localhost
        allow 127.0.0.1
        allow 192.168.0.15
        allow 192.168.88.200
        allow 10.152.10.100
    aspects_monit_local_probes:
      localresources: |
        check system {{ ansible_hostname }}
          if loadavg (1min) > 10 for 3 times within 5 cycles then alert
          if loadavg (5min) > 6 for 3 times within 5 cycles then alert
          if memory usage > 82% for 3 times within 5 cycles then alert
          if swap usage > 15% for 3 times within 5 cycles then alert
          if cpu usage (user) > 70% for 3 times within 5 cycles then alert
          if cpu usage (system) > 30% for 3 times within 5 cycles then alert
          if cpu usage (wait) > 20% for 3 times within 5 cycles then alert
        not every "* 1-2 * * *"
```

## host_vars/vm.ubuntutrusty.lab
```yaml
    ---
    # Configure Monit
    aspects_monit_enabled: True
    aspects_monit_run_install: True
    aspects_monit_run_update: True
    aspects_monit_update_excutable_relative_path: files/monit/bin/monit
    aspects_monit_update_excutable_destination: /usr/bin/monit
    aspects_monit_mmonit: ""
    #aspects_monit_mmonit: "set mmonit http://mmonit/collector"
    aspects_monit_check_interval: "60"
    aspects_monit_logfile: "syslog facility log_daemon"
    aspects_monit_mailserver: "localhost"
    aspects_monit_alert_recipients:
      reagand: "you@example.tld"
    aspects_monit_web_server: |
      set httpd
        port 2812
        use address {{ ansible_fqdn }}
        allow localhost
        allow 127.0.0.1
        allow 192.168.0.15
        allow 192.168.88.200
        allow 10.152.10.100
    aspects_monit_local_probes:
      localresources: |
        check system {{ ansible_hostname }}
          if loadavg (1min) > 10 for 3 times within 5 cycles then alert
          if loadavg (5min) > 6 for 3 times within 5 cycles then alert
          if memory usage > 82% for 3 times within 5 cycles then alert
          if swap usage > 15% for 3 times within 5 cycles then alert
          if cpu usage (user) > 70% for 3 times within 5 cycles then alert
          if cpu usage (system) > 30% for 3 times within 5 cycles then alert
          if cpu usage (wait) > 20% for 3 times within 5 cycles then alert
        not every "* 1-2 * * *"
```

## host_vars/vm.nichedistro.lab
```yaml
    ---
    # Configure Monit
    aspects_monit_enabled: True
    aspects_monit_run_install: False
    aspects_monit_run_manual_install: True
    aspects_monit_use_manual_tasks: True
    aspects_monit_run_update: False
    aspects_monit_update_excutable_relative_path: files/monit/bin/monit
    aspects_monit_update_excutable_destination: /usr/bin/monit
    aspects_monit_mmonit: ""
    #aspects_monit_mmonit: "set mmonit http://mmonit/collector"
    aspects_monit_check_interval: "60"
    aspects_monit_logfile: "syslog facility log_daemon"
    aspects_monit_mailserver: "localhost"
    aspects_monit_alert_recipients:
      reagand: "you@example.tld"
    aspects_monit_web_server: |
      set httpd
        port 2812
        use address {{ ansible_fqdn }}
        allow localhost
        allow 127.0.0.1
        allow 192.168.0.15
        allow 192.168.88.200
        allow 10.152.10.100
    aspects_monit_local_probes:
      localresources: |
        check system {{ ansible_hostname }}
          if loadavg (1min) > 10 for 3 times within 5 cycles then alert
          if loadavg (5min) > 6 for 3 times within 5 cycles then alert
          if memory usage > 82% for 3 times within 5 cycles then alert
          if swap usage > 15% for 3 times within 5 cycles then alert
          if cpu usage (user) > 70% for 3 times within 5 cycles then alert
          if cpu usage (system) > 30% for 3 times within 5 cycles then alert
          if cpu usage (wait) > 20% for 3 times within 5 cycles then alert
        not every "* 1-2 * * *"
```
## Playbook
```yaml
    - hosts:
      - vm.redhat.lab
      - vm.ubuntutrusty.lab
      - vm.nichedistro.lab
      roles:
      - aspects_monit
```

# License

MIT
