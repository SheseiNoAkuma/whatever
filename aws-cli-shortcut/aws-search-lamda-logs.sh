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


#Received events for bucket [cbportal-prod-mp] and key [GDM_00046959_CAS.xml]
#2021/08/17/[$LATEST]d39bce1f6a3445c5b6447fae5797cd2e"
uat-mp-emission

mp-aggregations

#mp aggregation in prod
aws logs filter-log-events --log-group-name /aws/lambda/mp-aggregations --start-time 1639476000 --filter-pattern "null"  --profile generali-eks --region eu-west-1

aws logs filter-log-events --log-group-name /aws/lambda/uat-mp-aggregations --start-time 1639476000 --end-time 1639490400 --filter-pattern "null"  --profile generali-eks --region eu-west-1


aws logs filter-log-events --log-group-name /aws/lambda/prod-mp-onload --start-time 1647993600000 --filter-pattern "38212"  --profile generali-eks --region eu-west-1
