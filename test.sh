#!/bin/bash

if [[ -z "${AWS_ACCESS_KEY_ID}" ]]; then
  echo "Error: AWS_ACCESS_KEY_ID environment variable is not set"
  exit 1
fi

if [[ -z "${AWS_SECRET_ACCESS_KEY}" ]]; then
  echo "Error: AWS_SECRET_ACCESS_KEY environment variable is not set"
  exit 1
fi

if [[ -z "${AWS_DEFAULT_REGION}" ]]; then
  echo "Error: AWS_DEFAULT_REGION environment variable is not set"
  exit 1
fi

if [[ -z "${KUBECONFIG_FILE_S3_URL}" ]]; then
  echo "Error: KUBECONFIG_FILE_S3_URL environment variable is not set"
  exit 1
fi

# Check if required arguments are present
if [[ -z "$EKS_IMAGE_REPOSITORY" ]]; then
  echo "Repository argument is missing."
  exit 1
fi
if [[ -z "$EKS_CHART_NAME" ]]; then
  echo "Chart name argument is missing."
  exit 1
fi
if [[ -z "$EKS_NAMESPACE" ]]; then
  echo "Namespace argument is missing."
  exit 1
fi