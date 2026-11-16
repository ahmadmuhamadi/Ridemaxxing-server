.PHONY: fmt lint test run build docker-up docker-down

# Format all Go files in the project
fmt:
	gofmt -s -w .

# Run linter (or fallback to go vet)
lint:
	go vet ./...

# Run tests with the race detector
test:
	go test -v -race ./...

# Run the API server locally
run:
	go run ./cmd/api

# Build the production binary
build:
	CGO_ENABLED=0 go build -ldflags="-s -w" -o bin/api ./cmd/api

# Start Postgres & Redis via Docker Compose
docker-up:
	docker compose up -d

# Stop containers
docker-down:
	docker compose down