FROM mcr.microsoft.com/dotnet/sdk:10.0-alpine AS base

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=10.0.0

LABEL org.opencontainers.image.title="dotnet-aot-sdk" \
      org.opencontainers.image.description=".NET SDK with native AOT compilation toolchain" \
      org.opencontainers.image.source="https://github.com/twistingmercury/dotnet-aot-sdk" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.authors="Jeremy K. Johnson" \
      org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.version="${VERSION}"

# Install clang for AOT native compilation
RUN apk add --no-cache clang build-base zlib-dev
