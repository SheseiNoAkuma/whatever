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
#XML Ingestion
#aws s3 ls "s3://cbportal-prod-ingestion-mp/" --recursive --profile generali-eks --region eu-west-1 | grep 41159
#XML
#aws s3 ls "s3://cbportal-prod-mp/" --recursive --profile generali-eks --region eu-west-1 | grep 41159
#xml -> JSON
#aws s3 ls "s3://cbportal.prod.mp.aggregations/" --recursive --profile generali-eks --region eu-west-1 | grep 41159

#aggregated
#aws s3 ls "s3://cbportal.prod.kpi.aggregations/" --recursive --profile generali-eks --region eu-west-1 | grep 40504
#KPI splitter
#aws s3 ls "s3://cbportal.prod.kpi.splitter/" --recursive --profile generali-eks --region eu-west-1 | grep 41159

#Hi claudiamiliziano
 #Yes it's feasible we need to change the logic of displaying this box. So please if Marco Righi
 # or someone else can give us JSON of client which have two programs because all of them that we have currently
 # have only one program(Property or Casualty). I need that for testing. Thanks

# -------------------------------

#UAT

#XML 
#aws s3 ls "s3://cbportal-uat-mp/" --recursive --profile generali-eks --region eu-west-1 | grep 31337
#Json
#aws s3 ls "s3://cbportal.uat.mp.aggregations/" --recursive --profile generali-eks --region eu-west-1 | grep 39703
