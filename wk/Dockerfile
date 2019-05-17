FROM buildpack-deps:stretch

WORKDIR /srv

RUN apt-get update -yq && apt-get install -yq xfonts-75dpi xfonts-base
RUN curl -L -o /srv/wkhtmltox_0.12.5-1.stretch_amd64.deb "https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb"
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

CMD [ "wkhtmltopdf" ]
