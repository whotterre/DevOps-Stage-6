FROM golang:1.21-alpine AS builder

# Multistage Dockerfile
# Build time
WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . . 

ENV CGO_ENABLED=0
RUN go build -o main .

# Run time 
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/main . 

CMD ["./main"]