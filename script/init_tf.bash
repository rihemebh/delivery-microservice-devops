#!/usr/bin/env bash  

cd ../infrastructure/terraform/stack_1
terraform apply
cd ../stack_2
terraform apply