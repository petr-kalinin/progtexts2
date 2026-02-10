FROM node:12

#RUN apt-get -y update
RUN apt-get -y install git

RUN mkdir -p /app

WORKDIR /app

RUN git clone https://github.com/petr-kalinin/sphinx_rtd_theme ./theme
WORKDIR /app/theme

RUN git checkout english

RUN npm install
RUN npm run build



FROM python:3

RUN mkdir -p /app/docs
WORKDIR /app/docs

RUN pip3 install -U sphinx==7.0.0

COPY --from=0 /app/theme /app/theme
RUN git clone https://github.com/petr-kalinin/progtexts2 .

RUN git checkout master
RUN make html
RUN make html
RUN cp -r _build _build_ru

RUN git checkout english
RUN rm -r _build
RUN make html
RUN make html
RUN cp -r _build _build_en


FROM nginx

COPY --from=1 /app/docs/_build_ru/html /usr/share/nginx/html/ru
COPY --from=1 /app/docs/_build_en/html /usr/share/nginx/html/en
COPY index-lang-redirect.html /usr/share/nginx/html/index.html
COPY nginx_default.conf /etc/nginx/conf.d/default.conf