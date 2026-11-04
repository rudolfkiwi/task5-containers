FROM --platform=$BUILDPLATFORM quay.io/projectquay/golang:1.27 AS build

ARG TARGETOS
ARG TARGETARCH

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o bin/app .

ENTRYPOINT ["go", "test", "-v", "./..."]
