# ---- Dependencies ----
FROM node:15-alpine AS dependencies
WORKDIR /root/deps
RUN npm set progress=false && npm config set depth 0
RUN npm install serverless serverless-python-requirements


#
# ---- Release ----
FROM python:3.8-alpine AS release


RUN apk update \
    && apk add --no-cache nodejs-current \
    && rm -rf \
         /usr/share/man/* \
         /usr/includes/* \
         /var/cache/apk/* \
         /root/.npm/* \
         /usr/lib/node_modules/npm/man/* \
         /usr/lib/node_modules/npm/doc/* \
         /usr/lib/node_modules/npm/html/* \
         /usr/lib/node_modules/npm/scripts/* \
    && addgroup -S appgroup \
    && adduser -S appuser -G appgroup

USER appuser
WORKDIR /home/appuser


COPY --from=dependencies /root/deps/node_modules ./node_modules
ENV PATH ./node_modules/.bin:$PATH

