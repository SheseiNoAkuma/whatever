#!/bin/bash

grep --include=\*.xsd -rnw '.' -e "http://maven.apache.org/ASSEMBLY/2.1.0"
