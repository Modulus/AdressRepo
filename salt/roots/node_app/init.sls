include:
  - tools.git

git clone https://github.com/Modulus/AdressRepoNode.git:
  git.latest:
    - name: https://github.com/Modulus/AdressRepoNode.git
    - rev: master
    - branch: master
    - user: vagrant
    - target: /home/vagrant/nodeapp/
    - fetch_tags: True
    - require:
      - pkg: git