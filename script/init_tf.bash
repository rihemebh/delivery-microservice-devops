#!/usr/bin/env bash  

set -e

TERR_PATH="../infrastructure/terraform"
cd ${TERR_PATH}/stack_1
terraform apply
cd ${TERR_PATH}/stack_2
terraform apply