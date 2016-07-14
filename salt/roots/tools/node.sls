include:
  - tools.curl

node.prepare:
  cmd.run:
    - name: curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    - require:
      - pkg: curl

apt-get update:
  cmd.run:
    - name: apt-get update
    - require:
      - cmd: node.prepare


nodejs:
  pkg.installed:
    - name: nodejs
    #- version: v4.4.5
    - require:
      - cmd: apt-get update
      - pkg: build-essential

build-essential:
  pkg.installed


mongodb:
  npm.installed:
    - require:
      - pkg: nodejs
