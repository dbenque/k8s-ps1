KC="";for c in `ls -p ~/.kube | grep -v '/'`; do KC=~/.kube/$c:$KC; done;
export KUBECONFIG=$KC
