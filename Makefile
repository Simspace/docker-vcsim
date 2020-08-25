build:
	docker build . -t vcsim:$(shell git rev-parse --short HEAD)
