#!/bin/bash  

export PROJECT_ID="core-photon-372612"
export REGION="us-central1"
export ZONE="us-central1-c"

#How to create a service account on Google Cloud?


gcloud iam service-accounts create terraformdemo \
   --description="DESCRIPTION" \
   --display-name="terraform demosa"
#And to grant an IAM policy to the newly created account:
   
gcloud projects add-iam-policy-binding core-photon-372612 \
   --member="serviceAccount:terraformdemo@core-photon-372612.iam.gserviceaccount.com" \
   --role="roles/editor"

#Download the key file for the service account

gcloud iam service-accounts keys create credentials.json \
 --iam-account=terraformdemo@${PROJECT_ID}.iam.gserviceaccount.com \
 --project=${PROJECT_ID}
 
export export GOOGLE_APPLICATION_CREDENTIALS="/Users/biswanathgiri/googlecloudplatform/terraform-practice/terraform-create-gce-demo/credentials.json"
