# Template for grpc-gateway 

ARG alpine_version=3.17
ARG go_version=1.19
FROM golang:$go_version-alpine$alpine_version AS build

ARG go_version

RUN apk add --update --no-cache git
WORKDIR /app

# Copy all of the staged files (protos plus go source)
COPY . /app/

# RUN go mod tidy -compat=$go_version

# Build the gateway
RUN go build -o /app/grpc_gateway server/main.go

FROM alpine:$alpine_version AS final
WORKDIR /app
COPY --from=build /app/grpc_gateway /app/
COPY --from=build /app/gen/openapiv2/proto/echochamber/helloworld/v1/greeter.swagger.json /app/

EXPOSE 80
ENTRYPOINT ["/app/grpc_gateway"]

