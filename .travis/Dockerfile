FROM alpine:edge
RUN apk add --no-cache cabal ghc libc-dev make wget
RUN cabal v1-update
VOLUME /code
WORKDIR /code
