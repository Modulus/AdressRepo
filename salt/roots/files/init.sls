include:
  - tools.curl
  - tools.unzip

download geodata:
  cmd.run:
      - name: curl http://download.geonames.org/export/zip/allCountries.zip
      - cwd: /home/vagrant
      - require:
        - pkg: curl

download readme:
  cmd.run:
      - name: curl http://download.geonames.org/export/zip/readme.txt
      - cwd: /home/vagrant
      - require:
        - pkg: curl

#unzip geodata:
#    cmd.run:
