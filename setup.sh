# Create the Logging Namespace
kubectl create -f kube-logging.yaml

# Create the Elastic Search service
kubectl create -f elasticsearch_svc

# Create the Elastic Search service
kubectl create -f elasticsearch_statefulset.yaml
kubectl rollout status sts/es-cluster --namespace=kube-logging
curl http://localhost:9200/_cluster/state?pretty

# Create the Kibana Deployment and Service
kubectl create -f kibana.yaml
kubectl rollout status deployment/kibana --namespace=kube-logging

# Create the Fluentd Daemonset
kubectl create -f fluentd.yaml
kubectl get ds --namespace=kube-logging
