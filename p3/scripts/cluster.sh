# Check cluster
kubectl config get-contexts

# Change cluster context
kubectl config use-context $CONTEXT_NAME

# Veify active cluster
kubectl cluster-info