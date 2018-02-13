#!/bin/bash

KC="";for c in `ls -p ~/.kube 2>/dev/null | grep -v '/'`; do KC=~/.kube/$c:$KC; done;
export KUBECONFIG=$(echo $KC | sed -r 's/(.*)(:)+/\1/g')
