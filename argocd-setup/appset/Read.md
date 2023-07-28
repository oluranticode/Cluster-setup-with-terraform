kubectl apply -f dev-appset.yaml -n argocd

kubectl describe ApplicationSet dev-cluster-appset -n argocd

context name === arn:aws:eks:us-east-1:326355388919:cluster/product-flw-dev