#!/bin/bash

grep --include=\*.xsd -rnw '.' -e "urn:wildfly:microprofile-health-smallrye:1.0"
