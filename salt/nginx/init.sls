nginx:
  pkg.installed: []
  service.running:
    - require:
      - pkg: nginx

public:
  firewalld.present:
    - name: public
    - ports:
      - 80/tcp

/usr/share/nginx/html/index.html:
  file.managed:
    - source: salt://nginx/index.html
    - user: root
    - group: root
