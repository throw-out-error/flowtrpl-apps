FROM creepinson/alpine-pnpm

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.name="node-media-server" \
    org.label-schema.description="A Node.js implementation of RTMP Server" \
    org.label-schema.usage="https://github.com/illuspas/Node-Media-Server#readme" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.vcs-url="https://github.com/illuspas/Node-Media-Server" \
    org.label-schema.vendor="illuspas" \
    org.label-schema.version="2.1.9" \
    maintainer="https://github.com/illuspas"

WORKDIR /tmp/ffmpeg

ENV FFMPEG_VERSION="4.2.2"
ENV FFMPEG_VERSION_URL="http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2"
ENV BIN="/usr/bin"

RUN apk add --no-cache ffmpeg

WORKDIR /usr/src/app

COPY package*.json ./

RUN pnpm i

COPY . .

EXPOSE 1935 8000

CMD ["pnpm","run", "start"]
