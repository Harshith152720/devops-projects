# login
az login

# variables
RG="rg-gamingcafe"
LOCATION="centralindia"  # pick nearest region
ACR_NAME="gcrgamingcafe$RANDOM"  # unique name
AKS_NAME="aks-gamingcafe"
NODE_COUNT=2
NODE_SIZE="Standard_D4as_v5"

# create resource group
az group create -n $RG -l $LOCATION

# create ACR (private registry)
az acr create -n $ACR_NAME -g $RG --sku Standard

# create AKS with managed identity and attach ACR
az aks create -g $RG -n $AKS_NAME \
  --node-count $NODE_COUNT \
  --node-vm-size $NODE_SIZE \
  --enable-managed-identity \
  --attach-acr $ACR_NAME \
  --generate-ssh-keys

# get credentials
az aks get-credentials -g $RG -n $AKS_NAME
