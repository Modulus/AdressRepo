include:
  - tools.curl
  - tools.unzip

{%- set url = "http://download.geonames.org/export/zip/NO.zip" %}
# "http://download.geonames.org/export/zip/allCountries.zip"

download geodata:
  cmd.run:
      - name: curl -o codes.zip {{ url }}
      - cwd: /home/vagrant
      #- output_loglevel: quiet
      - require:
        - pkg: curl

download readme:
  cmd.run:
      - name: curl -O http://download.geonames.org/export/zip/readme.txt
      - cwd: /home/vagrant
      #- output_loglevel: quiet
      - require:
        - pkg: curl

geonames unzipped:
  archive.extracted:
    - name: /home/vagrant/countries
    - source: /home/vagrant/codes.zip
    - archive_format: zip
    - require:
      - cmd: download geodata



#unzip geodata:
#    cmd.run:
