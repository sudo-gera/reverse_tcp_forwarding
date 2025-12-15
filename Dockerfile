FROM ubuntu@sha256:4e0171b9275e12d375863f2b3ae9ce00a4c53ddda176bd55868df97ac6f21a6e AS universal
RUN : change this value to rebuild whole image: 2025 10 27 01 59 39

COPY . .

RUN bash -xeu ./build.sh

