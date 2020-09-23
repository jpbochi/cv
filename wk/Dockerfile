FROM buildpack-deps:focal

WORKDIR /srv

RUN apt-get update -yq && apt-get install -yq xfonts-75dpi xfonts-base libjpeg-turbo8

RUN curl -L -o wkhtmltox_0.12.6-1.focal_amd64.deb "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb"
RUN dpkg -i wkhtmltox_0.12.6-1.focal_amd64.deb

CMD [ "wkhtmltopdf" ]
