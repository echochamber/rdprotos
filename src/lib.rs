include!("gen/mod.rs");

// Re-export the WKT filedescriptor so the server can provide them in reflection API.
// Bug in prost plugin for buf gen --include-wkt flag currently prevents us from using that.
pub use protoc_wkt::google::protobuf::FILE_DESCRIPTOR_SET as WKT_FILE_DESCRIPTOR_SET;