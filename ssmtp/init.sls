{% from "ssmtp/map.jinja" import ssmtp_map with context %}

ssmtp:
  pkg.installed:
    - name: ssmtp
  file.managed:
    - name: /etc/ssmtp/ssmtp.conf
    - user: root
    - group: mail
    - mode: 640
    - template: jinja
    - source: salt://ssmtp/files/ssmtp.conf
    - require:
      - pkg: ssmtp
    - context:
      ssmtp: {{ ssmtp_map }}

/etc/ssmtp/revaliases:
  file.managed:
    - user: root
    - group: mail
    - mode: 644
    - template: jinja
    - source: salt://ssmtp/files/revaliases
    - require:
      - pkg: ssmtp
    - context:
      ssmtp: {{ ssmtp_map }}

/etc/ssmtp/tls:
  file.directory:
    - makedirs: True
    - user: root
    - group: mail
    - mode: 0750
    - require:
      - pkg: ssmtp
