FROM node:latest

RUN npm install -g elm elm-test

ENV ELM_ROOT /var/www/elm

RUN mkdir -p ELM_ROOT

WORKDIR $ELM_ROOT

COPY elm.json $ELM_ROOT

RUN elm install elm/json

COPY . .

CMD ["elm-reactor", "--address=127.0.0.1", "--port=8000"]
