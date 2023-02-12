#Set Env variables 

export PROJECT_ID="core-photon-372612"
export REGION="us-central1"
export ZONE="us-central1-c"



#1.1 Set region and zones

gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-c
gcloud config set project core-photon-372612

#1.2. Create a VM with a web server
gcloud compute instances create quickstart-instance \
--project=${PROJECT_ID} --zone=${ZONE} --machine-type=e2-standard-2 \
--subnet=default --scopes="cloud-platform" \
--tags=http-server,https-server --image=ubuntu-minimal-1604-xenial-v20210119a \
--image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard \
--boot-disk-device-name=quickstart-instance

#1.3. Create a Firewall Rule
gcloud compute --project=${PROJECT_ID} firewall-rules create default-allow-http \
--direction=INGRESS --priority=1000 --network=default --action=ALLOW \
--rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

#1.4. SSH to the VM & Install the apache2 Package
sudo apt-get update && sudo apt-get install apache2 -y
echo '<!doctype html><html><body><h1>Welcome To Chennai!</h1></body></html>' | sudo tee /var/www/html/index.html

#1.5. Verify the Installation
Open the browser and type http://<quickstart-instance-Public-IP>
#1.6. Stop the VM

#PART-2: GKE Processing Cluster Setup
2.1. Creating a processing cluster
Create a GKE cluster in the Cloud that you use as a processing cluster. This is where you install Migrate for Anthos and GKE and execute the migration.

gcloud container clusters create migration-processing \
--project=${PROJECT_ID} --zone=${ZONE} --machine-type e2-standard-4 \
--image-type ubuntu --num-nodes 2 \
--subnetwork "projects/${PROJECT_ID}/regions/${REGION}/subnetworks/default"







export PROJECT_ID=$DEVSHELL_PROJECT_ID

#Task 1. Create the source Compute Engine
gcloud compute  instances create   source-vm  --zone=us-east1-b --machine-type=e2-standard-2   --subnet=default --scopes="cloud-platform"   --tags=http-server,https-server --image=ubuntu-minimal-1604-xenial-v20210119a   --image-project=ubuntu-os-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard   --boot-disk-device-name=source-vm \
  --metadata startup-script='#! /bin/bash
  # Installs apache and a custom homepage
  sudo su -
  apt-get update
  apt-get install -y apache2
  cat <<EOF > /var/www/html/index.html
  <html><body><h1>See you in Google Cloud </h1>
  </body></html>
  EOF'
#Create a firewall rule to allow the HTTP:
gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW   --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server
#Task 2. Create a processing cluster
gcloud container clusters create migration-processing   --project=$PROJECT_ID --zone=us-east1-b --machine-type e2-standard-4   --image-type ubuntu_containerd --num-nodes 3 --enable-stackdriver-kubernetes   --subnetwork "projects/$PROJECT_ID/regions/us-east1/subnetworks/default"