FROM golang:alpine AS builder

COPY /go /go/src/

WORKDIR /go/src/

RUN go build -o /go/bin/main

ENTRYPOINT [ "/go/bin/main" ]

FROM scratch as production

COPY --from=build /go/src/app/myapp /myapp

CMD ["./myapp"]