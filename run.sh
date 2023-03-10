#!/bin/bash

# run the test
sh test.sh

# copy the kubeconfig file from S3
aws s3 cp ${KUBECONFIG_FILE_S3_URL} ~/.kube/config

sh ./bin/install_chart.sh