FROM buildpack-deps:jessie

WORKDIR /srv

RUN curl -L -o /srv/wkhtmltox.tar.xz "https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox-0.12.5_linux-generic-amd64.tar.xz"
RUN tar -xf wkhtmltox.tar.xz
RUN ln -f -s /srv/wkhtmltox/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

CMD [ "wkhtmltopdf" ]
