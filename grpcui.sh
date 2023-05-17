grpc_address=${1:-localhost:50051}

PROTO_EXPORT_DIR="/tmp/rdproto"

SCRIPT_DIR="$(realpath $( dirname -- "$0"; ) )"
echo "$SCRIPT_DIR"
mkdir -p $PROTO_EXPORT_DIR
buf export "${SCRIPT_DIR}" --output="$PROTO_EXPORT_DIR"
echo "Exported protos and deps to $PROTO_EXPORT_DIR"
echo "Proto files use are: "
find   /tmp/rdproto/ -type f | while read line; do echo "   - $line" ; done

# grpcui -plaintext  \
#   -import-path "$PROTO_EXPORT_DIR" \
#   -import-path "$SCRIPT_DIR/proto" \
#   -proto $SCRIPT_DIR/proto/echochamber/helloworld/v1/* \
#   "$grpc_address"