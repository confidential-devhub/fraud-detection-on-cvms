#!/bin/bash

set -e

DATA_FOLDER=${DATA_FOLDER:-"datasets_enc"}
REGISTRY=${REGISTRY:-"quay.io/confidential-devhub"}
IMAGE_NAME=${IMAGE_NAME:-"fraud-detection-datasets"}
TAG_NAME=${TAG_NAME:-"latest"}

if [ ! -f "Dockerfile" ]; then
  echo "Error: 'Dockerfile' is missing from this directory."
  exit 1
fi

if [ ! -d "$DATA_FOLDER" ]; then
  echo "Error: Directory '$DATA_FOLDER' does not exist."
  exit 1
fi

if [ -z "$(ls -A $DATA_FOLDER)" ]; then
  echo "Error: Directory '$DATA_FOLDER' exists but is empty."
  exit 1
fi

# If all checks pass, build the image
echo "Starting build for '$REGISTRY/$IMAGE_NAME:$TAG_NAME'..."
podman build -t "$REGISTRY/$IMAGE_NAME:$TAG_NAME" .

echo "Build complete."
echo "You can now push the image by running"
echo "# podman push '$REGISTRY/$IMAGE_NAME:$TAG_NAME'"