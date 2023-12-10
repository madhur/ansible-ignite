andrewrothstein.ignite
===========================
![Build Status](https://github.com/andrewrothstein/ansible-ignite/actions/workflows/build.yml/badge.svg)

Installs an [Apache Ignite](https://ignite.apache.org) cluster

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: ignite
  roles:
    - andrewrothstein.ignite
      ignite_network:
        type: group
        group_name: ignite
        iface: eth0
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
