FROM golang:alpine AS builder

COPY /go /go/src/

WORKDIR /go/src/

RUN go build -o /go/main

FROM scratch

COPY --from=builder /go/main /go/main

ENTRYPOINT [ "/go/main" ]