include:
  - tools.curl
  - tools.unzip

download geodata:
  cmd.run:
      - name: curl -O http://download.geonames.org/export/zip/allCountries.zip
      - cwd: /home/vagrant
      - output_loglevel: quiet
      - require:
        - pkg: curl

download readme:
  cmd.run:
      - name: curl -O http://download.geonames.org/export/zip/readme.txt
      - cwd: /home/vagrant
      - output_loglevel: quiet
      - require:
        - pkg: curl

geonames unzipped:
  archive.extracted:
    - name: /home/vagrant/countries/
    - source: /home/vagrant/allCountries.zip
    - archive_format: zip
    - require:
      - cmd: download geodata



#unzip geodata:
#    cmd.run:
