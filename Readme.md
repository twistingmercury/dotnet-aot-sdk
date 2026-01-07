# dotnet-aot-sdk

> **Maturity Level**: Emerging - Convenience image for .NET Native AOT development

A Docker image extending the official .NET SDK 10.0 Alpine image with the
native toolchain required for Native AOT compilation.

## Usage

Pull the image from GitHub Container Registry:

```bash
docker pull ghcr.io/twistingmercury/dotnet-aot-sdk:10.0-alpine
```

Use as a base image in your Dockerfile:

```dockerfile
FROM ghcr.io/twistingmercury/dotnet-aot-sdk:10.0-alpine AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/runtime-deps:10.0-alpine AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["./YourApp"]
```

## How it works

This image adds the native compilation toolchain to the .NET SDK Alpine image:

- **clang** - LLVM compiler for native code generation
- **build-base** - Essential build tools (make, gcc, libc-dev)
- **zlib-dev** - Compression library headers

Native AOT compiles your .NET application to native machine code ahead of time,
eliminating the need for JIT compilation at runtime.

## Development Considerations

### Building

Build the image locally:

```bash
make build
```

Or directly with Docker:

```bash
docker build -t dotnet-aot-sdk:10.0-alpine .
```

### Versioning

This image tracks the .NET SDK version it extends. Tags follow the pattern
`{sdk-version}-alpine` (e.g., `10.0-alpine`).
