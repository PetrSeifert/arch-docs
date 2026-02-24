FROM rust:slim AS builder
RUN cargo install mdbook
WORKDIR /book
COPY . .
RUN mdbook build

FROM nginx:alpine
COPY --from=builder /book/book /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
