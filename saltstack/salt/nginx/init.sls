nginx:
  pkg:
    - installed
    - pkgs:
      - nginx
      - php5-mysql
      - php5-fpm
      - php5-cli
      - php5-mcrypt 

  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/sites-available/default

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx/files/default
    - template: jinja
    - mode: 644
    - user: root
    - group: root
