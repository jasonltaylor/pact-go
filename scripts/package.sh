#!/bin/bash -e

set -e

export PACT_MOCK_SERVICE_VERSION=2.1.0 # Seg faults...
export PACT_PROVIDER_VERIFIER_VERSION=1.3.1-1

echo "==> Building App"
make bin

# Create the OS specific versions of the mock service and verifier
echo "==> Building Ruby Binaries..."
scripts/build_standalone_packages.sh

echo
echo "==> Results:"
ls -hl dist/
