APP ?= test_app
REGISTRY=us-central1-docker.pkg.dev/project-ccb012cb-da42-4fd4-bfd/task-repo-dockerfile
VERSION ?= 1.0.0

linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -o app-linux-amd64 .

arm:
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -o app-linux-arm64 .

macos:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -o app-linux-amd64 .
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -v -o app-linux-arm64 .

windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -v -o app-linux-amd64 .


image:
	docker build -t ${REGISTRY}/${APP}:${VERSION} .

clean:
	docker rmi ${REGISTRY}/${APP}:${VERSION}
