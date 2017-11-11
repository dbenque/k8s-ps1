# k8s-ps1

Set of bash utilities for better kubernetes experience under shell

# Features

## Kubectl

kubectl kubectl kubectl ... save some keystroke. The following alias is defined
```
alias k='kubectl'
```

## Namespace

switch to another existing namespace using **kns**

```
kns default
kns kube-system
```

## Multiple config files

if you have multiple context in **~/.kube** and want to use they all at the same time the **KUBECONFIG** variable must be correctly set ( https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/#set-the-kubeconfig-environment-variable ).

The **kcontext.sh** script will set the **KUBECONFIG** for you.

Pay attention to the fact that some other CLI may use **KUBECONFIG** and does not support multiple config, this is the case of **istioctl** for example ( https://github.com/istio/issues/issues/112 )

## PS1

If you are dealing with multiple kubernetes context and namespace from the console, better to have the relevant information in your PS1

Update your PS1 with **__kube_ps1**, for example:

```

PS1='\[\e[0;29m\][\e[0;31m$?\e[0;29m] \[\e[0;33m\]\t $(__kube_ps1) \[\e[0;32m\]\u@\h:\[\e[1;34m\]\w\[\e[m\]\[\e[0;33m\]$(__git_ps1)\n\[\e[1;32m\]>\[\e[m\] '
```

To activate the feature in your console just call the function **kps1**. To stop kubernetes context info in the PS call the function **kps1-off**

```
[0] 22:16:59  david@ArchMSI:~/code/k8s-ps1 (master)
> kps1
[0] 22:17:03 [k8s: minikube/kube-system] david@ArchMSI:~/code/k8s-ps1 (master)
> kps1-off
[0] 22:17:17  david@ArchMSI:~/code/k8s-ps1 (master)
> 
```

# Installation

For PS1 feature and alias, source **.bash_k8s** file in your shell environment. Insert **__kube_ps1** call to $PS1.

For multiple config file management, source **kcontext.sh** file in your shell environment.