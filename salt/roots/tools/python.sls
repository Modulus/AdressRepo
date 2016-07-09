python-pip:
  pkg.installed:
    - require_in:
      - pip: mongoframes

mongoframes:
  pip.installed