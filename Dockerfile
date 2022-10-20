FROM node:lts-alpine3.16 as builder

COPY . .

RUN npm install

RUN npm run build

FROM scratch
COPY --from=builder /dist ./