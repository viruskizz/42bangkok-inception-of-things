## Roof cloud native storage
GITHUB_URL="https://raw.githubusercontent.com/rook/rook/refs/heads/master/deploy/examples"

kubectl create \
    -f "$GITHUB_URL/crds.yaml" \
    -f "$GITHUB_URL/common.yaml" \
    -f "$GITHUB_URL/operator.yaml"

kubectl delete \
    -f "$GITHUB_URL/crds.yaml" \
    -f "$GITHUB_URL/common.yaml" \
    -f "$GITHUB_URL/operator.yaml"

kubectl create -f "$GITHUB_URL/cluster.yaml"

kubectl create -f "$GITHUB_URL/toolbox.yaml"

kubectl -n rook-ceph exec deploy/rook-ceph-tools -- ceph status

kubectl create -f "$GITHUB_URL/filesystem.yaml"

kubectl -n rook-ceph create -f "$GITHUB_URL/csi/cephfs/storageclass.yaml"

kubectl delete -f ../wordpress.yaml
kubectl delete -f ../mysql.yaml
kubectl delete -n rook-ceph cephblockpool replicapool
kubectl delete storageclass rook-ceph-block
kubectl delete -f csi/cephfs/kube-registry.yaml
kubectl delete storageclass csi-cephfs