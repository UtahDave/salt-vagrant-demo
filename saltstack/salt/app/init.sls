app:
  cmd.run:
    - name: 'mkdir -p /var/www;cd /var/www/;git clone https://github.com/hellofresh/sysadmin-test-app.git;mv sysadmin-test-app sysadmin-test;cd sysadmin-test;composer install'
    - unless: test -d /var/www/sysadmin-test
    - cwd: /root/
    - user: root

/var/www/sysadmin-test/.env:
  file.managed:
    - source: salt://app/files/env
    - template: jinja
    - mode: 644
    - user: root
    - group: root
