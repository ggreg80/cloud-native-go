NAME = cloud-native-go:1.0.0

default: build

docker:
	docker build -t $(NAME) .

build: 
	CGO_ENABLED=0 go build -a -installsuffix cgo ./...

install: 
	CGO_ENABLED=0 go install -a -installsuffix cgo ./...