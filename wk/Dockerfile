FROM buildpack-deps:bullseye

WORKDIR /srv

RUN apt-get update -yq && apt-get install -yq xfonts-75dpi xfonts-base

RUN curl -L -o wkhtmltox_0.12.6.1-2.bullseye_arm64.deb "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.bullseye_arm64.deb"
RUN dpkg -i wkhtmltox_0.12.6.1-2.bullseye_arm64.deb

CMD [ "wkhtmltopdf" ]
