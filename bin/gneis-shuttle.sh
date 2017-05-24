#!/bin/bash

env=${1:-test}
sshuttle --dns -r "${env}-bastion01a.${env}.gneis.io" 10.13.0.0/16 192.168.8.0/21

