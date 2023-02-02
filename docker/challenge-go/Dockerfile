FROM golang:1.19 AS builder

WORKDIR /usr/src/app

COPY challenge-go.go .
RUN go build challenge-go.go


FROM scratch

# copy the binary from the `build-stage`
COPY --from=builder /usr/src/app /

CMD ["./challenge-go"]