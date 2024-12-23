# argocd app create guestbook \
#     --repo https://github.com/argoproj/argocd-example-apps.git \
#     --path guestbook \
#     --dest-server https://kubernetes.default.svc \
#     --dest-namespace default

argocd app create guestbook \
    --path ./conf/app/hello \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace hello


kubectl apply -f ./conf/hello/app.yml
