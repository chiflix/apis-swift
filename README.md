# swift

The SagiAPI with Swift.

### Preparation For Update Protocols:

```shell
git clone https://github.com/grpc/grpc-swift.git -b nio
cd grpc-swift
make plugins
```
To build both of the necessary plugins: protoc-gen-swift, which generates Protocol Buffer support code and protoc-gen-grpc-swift, which generates gRPC interface code. 

Add to your PATH environment variable for plugins.

Go to the src/swift directory then to run:

```shell
git clone https://github.com/chiflix/apis.git
cd apis
sh codegen.sh

cd src/swift
swift build
swift test
```

### Using As Swift Package
It's easily using by swift package manager, Just add this repo address to your package configure file.
