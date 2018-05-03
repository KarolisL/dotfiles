#!/bin/bash


while read -r line; do
    echo $line | jq -r '.["@timestamp"] + " [" + .level + "] [" + .logger_name + "] " + .message + "\n+++" + .stack_trace'
done



