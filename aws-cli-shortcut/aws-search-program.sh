#!/bin/bash

#see https://kvz.io/bash-best-practices.html
set -o errexit
set -o pipefail
# for debug only
#set -o xtrace

display_usage() {
#  echo "you should export aws variable AWS_PROFILE with the aws profile to use before invoking this script"
  echo "you should provide 2 parameters, the first this the bucket you want to search in, the seconds the string you looking for (usually the program)"
}
# if less than two arguments supplied, display usage
if [ $# -le 1 ]; then
  display_usage
  exit 1
fi

# check whether user had supplied -h or --help . If yes display usage
if [[ ($# == "--help") || $# == "-h" ]]; then
  display_usage
  exit 0
fi

#if [ -z "$AWS_PROFILE" ]; then
#  display_usage
#  exit 1
#fi

AWS_PROFILE=generali-eks
AWS_REGION=eu-west-1

bucket=$1
search=$2

echo "executing check for profile <$AWS_PROFILE>, region <$AWS_REGION>, bucket <$bucket>, string <$search>"

echo "reading from bucket, the operation may take few seconds--------------"

aws s3 ls "s3://$bucket/" --recursive --profile $AWS_PROFILE | grep "$search"

echo "--------------search completed--------------"

#kpi in production

#Production
#XML 
#aws s3 ls "s3://cbportal-prod-mp/" --recursive --profile generali-eks --region eu-west-1 | grep 46066
#xml -> JSON
#aws s3 ls "s3://cbportal.prod.mp.aggregations/" --recursive --profile generali-eks --region eu-west-1 | grep 41956

#aggregated
#aws s3 ls "s3://cbportal.prod.kpi.aggregations/" --recursive --profile generali-eks --region eu-west-1 | grep 41129



# -------------------------------

#UAT

#XML 
#aws s3 ls "s3://cbportal-uat-mp/" --recursive --profile generali-eks --region eu-west-1 | grep 31337
#Json
#aws s3 ls "s3://cbportal.uat.mp.aggregations/" --recursive --profile generali-eks --region eu-west-1 | grep 39703