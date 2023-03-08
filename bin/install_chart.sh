#!/bin/bash

# Create the Helm chart
if [ -z ${EKS_CHART_VERSION+x} ]; then EKS_CHART_VERSION=latest; fi

helm create $EKS_CHART_NAME

# setting container_port (optionals)
sh ./bin/setting_container_port.sh

helm upgrade --install $EKS_CHART_NAME $EKS_CHART_NAME \
    --set image.repository=$EKS_IMAGE_REPOSITORY \
    --set image.tag=$EKS_CHART_VERSION \
    --namespace $EKS_NAMESPACE