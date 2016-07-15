mongodb repository:
  pkgrepo.managed:
    - humanname: mongodb repo
    - name: deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse
    - file: /etc/apt/sources.list.d/mongodb-org-3.2.list
    - keyserver: hkp://keyserver.ubuntu.com
    - keyid: EA312927
    - require_in:
      - pkg: mongodb-org

mongodb-org:
  pkg.installed:
    - name: mongodb-org
    - require_in:
      - service: mongod

mongod:
  service.running:
    - name: mongod
    - enable: True
    - watch:
      - file: /etc/mongod.conf

/etc/mongod.conf:
  file.replace:
    - pattern: "bindIp: 127.0.0.1"
    #- repl: "bindIp: {% for ip in grains['ipv4'] %}{{ip}}{% if not loop.last %},{% endif %}{% endfor %}"
    - repl: "bindIp: 0.0.0.0"
    - require:
      - pkg: mongodb-org
