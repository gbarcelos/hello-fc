FROM golang:1.18-alpine as goimg

WORKDIR /myworkdir

COPY main.go ./

RUN go build -o /execmain main.go

FROM scratch

COPY --from=goimg /execmain /execmain

ENTRYPOINT ["/execmain"]