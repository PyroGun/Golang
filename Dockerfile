FROM golang:latest

COPY . /src

WORKDIR /src
RUN go build -o ./main main.go 

FROM scratch
COPY --from=0 /src/main ./main
ENTRYPOINT [ "./main" ]

