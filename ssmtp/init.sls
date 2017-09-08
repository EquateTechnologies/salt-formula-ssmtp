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

/etc/aliases:
  file.managed:
    - name: /etc/aliases
    - user: root
    - group: mail
    - mode: 644
    - template: jinja
    - source: salt://ssmtp/files/aliases
    - require:
      - pkg: ssmtp

/etc/ssmtp/revaliases:
  file.managed:
    - name: /etc/ssmtp/revaliases
    - user: root
    - group: mail
    - mode: 644
    - template: jinja
    - source: salt://ssmtp/files/revaliases
    - require:
      - pkg: ssmtp

/etc/ssmtp/tls:
  file.directory:
    - name: /etc/ssmtp/tls
    - makedirs: True
    - user: root
    - group: mail
    - mode: 0750
    - require:
      - pkg: ssmtp
