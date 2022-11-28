export PROJECT_ID=$(curl "http://metadata.google.internal/computeMetadata/v1/instance/attributes/service_project" -H "Metadata-Flavor: Google")
export CLUSTER_NAME=$(curl "http://metadata.google.internal/computeMetadata/v1/instance/attributes/cluster_name" -H "Metadata-Flavor: Google")
export CLUSTER_LOCATION=$(curl "http://metadata.google.internal/computeMetadata/v1/instance/attributes/location" -H "Metadata-Flavor: Google")

# Authenticate to GKE cluster
gcloud container clusters get-credentials $CLUSTER_NAME --region $CLUSTER_LOCATION --project $PROJECT_ID

export existingips=$(gcloud container clusters describe $CLUSTER_NAME --region $CLUSTER_LOCATION --format json | jq -r '.masterAuthorizedNetworksConfig.cidrBlocks[] | .cidrBlock' | tr '\n' ',')
export bastionip=$(curl api.ipify.org)/32
gcloud container clusters update $CLUSTER_NAME --region $CLUSTER_LOCATION --enable-master-authorized-networks --master-authorized-networks $existingips$bastionip
