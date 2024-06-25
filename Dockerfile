FROM golang:latest

COPY . /src

WORKDIR /src
RUN go build -o /buildArtifact/main main.go 

FROM scratch
COPY --from=0 /buildArtifact/main ./main
ENTRYPOINT [ "./main" ]

