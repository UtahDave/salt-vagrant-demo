{% set mysql_user = salt['pillar.get']('mysql:mysql_user', '') -%}
{% set mysql_password = salt['pillar.get']('mysql:mysql_password', '') -%}

mysql:
  pkg.installed:
    - pkgs:
      - mysql-server
      - python-mysqldb
  service:
    - running

mysql-base:
  mysql_database.present:
    - name: backend

  mysql_user.present:
    - name: {{ mysql_user }}
    - password_hash: '{{ mysql_password }}'
