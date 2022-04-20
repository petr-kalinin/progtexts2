FROM node:12

RUN apt-get -y update
RUN apt-get -y install git

RUN mkdir -p /app

WORKDIR /app

RUN git clone https://github.com/petr-kalinin/sphinx_rtd_theme ./theme

WORKDIR /app/theme

RUN npm install
RUN npm run build



FROM python:3

RUN mkdir -p /app/docs
WORKDIR /app/docs

RUN pip3 install -U sphinx

COPY --from=0 /app/theme /app/theme
COPY . .
RUN make html
RUN make html



FROM nginx

COPY --from=1 /app/docs/_build/html /usr/share/nginx/html

