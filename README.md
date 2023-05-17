# rdproto

Repo with proto definitions for my grpc service, and build rules for creating rust modules.

Uses:

* [buf](https://github.com/bufbuild/buf)
  - For downloading externally managed protos our protos depend on (for example: google/api/http.proto).
  - Running prost-build and tonic-build
    - Generates boilerplate for importing a client.
    - Generates boilerplate to implement a server.
* Also has grpc http + json -> grpc gateway implementation https://github.com/grpc-ecosystem/grpc-gateway