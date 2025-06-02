gcloud compute instances create practicevm --machine-type e2-micro --zone=us-central1-a
gcloud compute instances create practicevm2 --machine-type e2-micro --zone=us-central1-a
gcloud compute instances create practicevm3 --machine-type e-2 micro --zone=us-central1-f
gcloud compute instances create practicevm3 --machine-type e2-micro --zone=us-central1-f
gcloud compute instances create practicevm4 --machine-type e2-micro --zone=us-central-d
clear
gcloud compute instances create practivevm4 machine-type e2-micro --zone=us-centralb-1
gcloud compute instances create practicevm4 --machine-type e2-micro zone=us-central1-b
gcloud compute instances create practicevm4 --machine-type e2-micro --zone=us-central1-b
gcloud projects list
gcloud config set project playground-s-11-9236d5e5
gcloud compute instances create practicevm5 --machine-type e2-micro --zone=uscentral1-a
gcloud compute instances create practicevm5 --machine-type e2-micro --zone=us-central1-a
gsutil mb create gs://storagecache
gsutil mb gs://storagecache
clear
terraform
touch main.tf
touch variables.tf
touch outputs.tf
touch providers.tf
touch terraform.tfvars
touch modules
cd modules
ls
rm README-cloudshell.txt
ls
clear
ls
cat modules
rm modules
ls
mkdir modules
cd modules
touch main.tf
touch variables.tf
touch outputs.tf
cd ~
touch backend.tf
cd modules
ls
rm main.tf outputs.tf variables.tf
ls
mkdir cloudrun
ls
cd cloudrun
touch main.tf variables.tf outputs.tf
ls
cd ~
ls
cd modules
ls
mkdir cloudsql
mddir frontend
mkdir frontend
ls
cd ~
ls
mkdir scripts
ls
cd scripts
touch deploy.sh
touch destroy.sh
ls
cd ~
ls
cd modules
ls
cd cloudsql
touch main.tf
ls
cd .
cd . .
cd ..
ls
cd frontend
touch main.tf
cd ~
cd modules
ls
cd cloudsql
ls
touch variables.tf
touch outputs.tf
touch README.md
cd .
cd ..
ls
cd cloudrun
ls
touch README.md
ls
cd ..
cd frontend
ls
touch variables.tf
touch outputs.tf
touch README.md
ls
cd ..
ls
mkdir load_balancer
ls
cd load_balancer
touch main.tf
touch variables.tf
touch outputs.tf
touch README.md
cd ~
ls
mkdir environments
cd environments
mkdir dev
mkdir prod
ls
cd dev
touch terraform.tfvars
touch backend.tf
cd ..
ls
cd prod
touch terraform.tfvars
touch backend.tf
clear
ls
cd ~
cd modules
ls
cd ~
clear
chmod +x scripts/*.sh
./scripts/deploy.sh
terraform init
gsutil mb gs://tf-state-playground-s-11-9236d5e5
terraform init
terraform plan
terraform init
terraform apply
terraform init && terraform apply
terraform init -upgrade
terraform apply
terraform init -upgrade
terraform apply
terraform init -upgrade
terraform apply
gcloud services enable sqladmin.googleapis.com
gcloud projects add-iam-policy-binding playground-s-11-9236d5e5   --member="user:cloud_user_p_4a537f6b@linuxacademygclabs.com"   --role="roles/storage.admin"
gcloud services list --enabled | grep -E 'sqladmin|storage'
gcloud projects get-iam-policy playground-s-11-9236d5e5   --flatten="bindings[].members"   --format="table(bindings.role,bindings.members)"
terraform destroy -auto-approve  # Clean up previous attempts
terraform apply
terraform destroy -auto-approve
clear
terraform init
terraform apply
terraform plan
terraform apply
gcloud services enable run.googleapis.com
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/shopeasy-api
cd ~/shopeasy-terraform/src/api  # Or wherever your API code is located
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/shopeasy-api
mkdir -p ~/shopeasy-api/src
cd ~/shopeasy-api/src
ls
touch server.js
touch package.json
ls
cd shopeasy-api
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/shopeasy-api
cd ~
cd shopeasy-api
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/shopeasy-api
cd ~/shopeasy-api
ls -la
ls -l
cd src
ls
cd ~/shopeasy-api
mv src/* ./
rmdir src
ls -l
clear
ls -l
gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/shopeasy-api
gcloud run deploy shopeasy-api   --image gcr.io/playground-s-11-9236d5e5/shopeasy-api   --region us-central1   --allow-unauthenticated
gcloud container images list-tags gcr.io/playground-s-11-9236d5e5/shopeasy-api
echo "https://storage.googleapis.com/$(gsutil ls | grep shopeasy-frontend | cut -d'/' -f4)/index.html"
cd ~
npx create-react-app shopeasy-frontend
cd shopeasy-frontend
cd ~
# 1. Make all objects publicly readable
gsutil iam ch allUsers:objectViewer gs://shopeasy-frontend-playground-s-11-9236d5e5
# 2. Enable website hosting
gsutil web set -m index.html -e index.html gs://shopeasy-frontend-playground-s-11-9236d5e5
# 3. Verify files are uploaded (should show index.html)
gsutil ls -r gs://shopeasy-frontend-playground-s-11-9236d5e5/**
gsutil ls gs://shopeasy-frontend-playground-s-11-9236d5e5
# Navigate to your frontend build directory
cd ~/shopeasy-frontend/build
# Upload files using object-level permissions
gsutil -m cp -r . gs://shopeasy-frontend-playground-s-11-9236d5e5/
gsutil -m acl ch -u AllUsers:R gs://shopeasy-frontend-playground-s-11-9236d5e5/**
gsutil ls -r gs://shopeasy-frontend-playground-s-11-9236d5e5/**
gsutil acl get gs://shopeasy-frontend-playground-s-11-9236d5e5/index.html | grep AllUsers
ls -la ~/shopeasy-frontend/build/
ls
cd shopeasy-frontend
ls
cd src
ls
cat app.js
cat App.js
cd ~/shopeasy-frontend
npm run build
cd ~/shopeasy-frontend
npm run build
gsutil -m cp -r build/* gs://shopeasy-frontend-playground-s-11-9236d5e5/
cd ~/shopeasy-frontend
npm run build
gsutil -m cp -r build/* gs://shopeasy-frontend-playground-s-11-9236d5e5/
ls -la ~/shopeasy-frontend/build/
cd ~/shopeasy-frontend
npm run build
ls -l
cd build
ls
# Upload all files
gsutil -m cp -r ~/shopeasy-frontend/build/* gs://shopeasy-frontend-playground-s-11-9236d5e5/
# Make files publicly accessible
gsutil -m acl ch -r -u AllUsers:R gs://shopeasy-frontend-playground-s-11-9236d5e5/
# Set index.html as default page
gsutil web set -m index.html -e index.html gs://shopeasy-frontend-playground-s-11-9236d5e5
# Check bucket contents
gsutil ls -r gs://shopeasy-frontend-playground-s-11-9236d5e5/**
# Test website access
curl -I https://storage.googleapis.com/shopeasy-frontend-playground-s-11-9236d5e5/index.html
# Verify index.html exists in your bucket
gsutil ls gs://shopeasy-frontend-playground-s-11-9236d5e5/index.html
# If missing, re-upload:
gsutil cp ~/shopeasy-frontend/build/index.html gs://shopeasy-frontend-playground-s-11-9236d5e5/
# Make all files publicly readable
gsutil -m acl ch -r -u AllUsers:R gs://shopeasy-frontend-playground-s-11-9236d5e5/
cloud_user_p_4a537f6b@cloudshell:~/shopeasy-frontend/build (playground-s-11-9236d5e5)$ 
gsutil web set -m index.html -e index.html gs://shopeasy-frontend-playground-s-11-9236d5e5/
curl https://shopeasy-api-37747295474.us-central1.run.app/products
# Make sure your API currently works:
curl https://shopeasy-api-37747295474.us-central1.run.app/products
# First, let's see if your database instance is running:
gcloud sql instances list
# Get your database IP address:
gcloud sql instances describe shopeasy-db --format="value(ipAddresses[0].ipAddress)"
# See what environment variables are set in your Cloud Run service:
gcloud run services describe shopeasy-api --region=us-central1 --format="value(spec.template.spec.template.spec.containers[0].env[].name,spec.template.spec.template.spec.containers[0].env[].value)"
# This will show you the exact database error:
gcloud run logs tail shopeasy-api --region=us-central1
# Get your database IP first:
DB_IP=$(gcloud sql instances describe shopeasy-db --format="value(ipAddresses[0].ipAddress)")
echo "Database IP: $DB_IP"
# Redeploy with proper database connection:
gcloud run deploy shopeasy-api   --source ~/shopeasy-api   --region us-central1   --allow-unauthenticated   --set-env-vars DB_HOST=$DB_IP,DB_PASSWORD=your_secure_password_here   --add-cloudsql-instances playground-s-11-9236d5e5:us-central1:shopeasy-db
# Get your database IP first:
DB_IP=$(gcloud sql instances describe shopeasy-db --format="value(ipAddresses[0].ipAddress)")
echo "Database IP: $DB_IP"
# Redeploy with proper database connection:
gcloud run deploy shopeasy-api   --source ~/shopeasy-api   --region us-central1   --allow-unauthenticated   --set-env-vars DB_HOST=$DB_IP,DB_PASSWORD=your_secure_password_here   --add-cloudsql-instances playground-s-11-9236d5e5:us-central1:shopeasy-db
git init
git add .
git commit -m "sandbox backup"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin master
# Set your GitHub identity
git config --global user.name "Jennifer Roberts"
git config --global user.email "jennifer.roberts713@yahoo.com"
# Initialize Git in your current working directory
git init
# Add all your files
git add .
# Commit your work
git commit -m "Backup from Pluralsight sandbox"
# Add your GitHub repo (replace REPO_NAME if it's different)
git remote add origin https://github.com/Jennifer-Roberts713/sandbox-backup.git
# Set the main branch and push
git branch -M main
git push -u origin main
git remote remove origin
git remote add origin https://github.com/Jennifer-Roberts713/sandbox-backup.git
git push -u origin main
cd ~
ls -l
git init
git add .
git commit -m "Initial commit: Added project files"
git remote add origin https://github.com/Jennifer-Roberts713/sandbox-backup.git
git push -u origin main
git init
git add .
git commit -m "File set up"
ls
git init
