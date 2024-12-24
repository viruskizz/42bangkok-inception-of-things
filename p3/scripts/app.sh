kubectl apply -f ./conf/hello/app.yml

kubectl port-forward -n hello service/guestbook-ui 8888:8888

# Stop forward port
ps aux | grep "kubectl port-forward"