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

COPY --from=0 /app /app
WORKDIR /app/docs
COPY . .

RUN pip3 install -U sphinx

RUN make html
RUN make html

FROM nginx
COPY --from=1 /app/docs/_build/html /usr/share/nginx/html

