#!/usr/bin/env bash

#  * Copyright LifeSciencesIQ or its affiliates. All Rights Reserved.
#  *
#  * Licensed under the Apache License, Version 2.0 (the "License").
#  * You may not use this file except in compliance with the License.
#  * You may obtain a copy of the License at
#  *
#  *   http://www.apache.org/licenses/LICENSE-2.0
#  *
#  * Unless required by applicable law or agreed to in writing, software
#  * distributed under the License is distributed on an "AS IS" BASIS,
#  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  * See the License for the specific language governing permissions and
#  * limitations under the License.



echo "Start Onboardiing Setup & Installation"

CURRENT_DIR=$(pwd)

# Check for src dir
if [ ! -d "${CURRENT_DIR}/src" ];
then
 echo "Directory ${CURRENT_DIR}/src not found"
 exit 2
fi

# Check for CDK Infrastructure as Code dir
if [ ! -d "${CURRENT_DIR}/iac" ];
then
 echo "Directory ${CURRENT_DIR}/CDK IAC not found"
 exit 2
fi

# check for yarn
if ! command -v yarn >/dev/null 2>&1;
then
  echo "yarn must be installed"
  exit 2
fi

# check for node
if ! command -v node >/dev/null 2>&1;
then
  echo "node must be installed"
  exit 2
fi

if [ -z $AWS_DEFAULT_REGION ]; then
  export AWS_REGION=$(aws configure list | grep region | awk '{print $2}')
  if [ "X$AWS_REGION" = "X" ]; then
    echo "AWS_REGION not set, check your aws profile or set AWS_DEFAULT_REGION"
    exit 2
  fi
else
  export AWS_REGION=$AWS_DEFAULT_REGION
fi

echo "AWS Region = $AWS_REGION"


cd ${CURRENT_DIR}
clear
echo "Onboardiing Setup & Installation"