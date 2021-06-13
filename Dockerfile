FROM golang:alpine AS builder 

WORKDIR /src
COPY echo.go echo.go

RUN CGO_ENABLED=0 go build -installsuffix 'static' -o /echo echo.go
FROM scratch
COPY --from=builder /echo /echo

ENTRYPOINT ["/echo"]
