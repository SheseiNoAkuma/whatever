#!/bin/bash

#see https://kvz.io/bash-best-practices.html
set -o errexit
set -o pipefail
# for debug only
#set -o xtrace

echo "this is just a work in progress"
exit 1

#aws logs filter-log-events --log-group-name my-group [--log-stream-names LIST_OF_STREAMS_TO_SEARCH] [--start-time 1482197400000] [--end-time 1482217558365] [--filter-pattern VALID_METRIC_FILTER_PATTERN]
aws logs filter-log-events --log-group-name /aws/lambda/uat-mp-emission --start-time 1625522400000 --filter-pattern 40504 --profile generali-eks --region eu-west-1


aws logs describe-log-groups --profile generali-eks --region eu-west-1


21585
uat-mp-emission

mp-aggregations

#mp aggregation in prod
aws logs filter-log-events --log-group-name /aws/lambda/mp-aggregations --start-time 1625522400000 --filter-pattern "Guns cache updated for number"  --profile generali-eks --region eu-west-1

