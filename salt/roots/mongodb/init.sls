mongodb repository:
  pkgrepo.managed:
    - humanname: mongodb repo
    - name: deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse
    - file: /etc/apt/sources.list.d/mongodb-org-3.2.list
    - keyserver: hkp://keyserver.ubuntu.com
    - keyid: EA312927
    - require_in:
      - pkg: install mongodb

install mongodb:
  pkg.installed:
    - name: mongodb-org
    - require_in:
      - service: mongod

mongod:
  service.running:
    - name: mongod
    - enable: True