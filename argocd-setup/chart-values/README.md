# argocd-setup

helm repo add argo https://argoproj.github.io/argo-helm 
helm repo list
kubectl create ns argocd
helm install argocd --namespace argocd argo/argo-cd -f chart-values/argocd.yaml  

# To get the password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

To upgrade
helm upgrade argocd --namespace argocd argo/argo-cd -f chart-values/argocd.yaml 


kubectl create ns argocd
helm install argocd --namespace argocd argo/argo-cd -f chart-values/argocd-new.yaml 


#### install argocd without using this manifest file
helm install argo argo/argo-cd