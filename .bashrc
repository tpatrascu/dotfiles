export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="/usr/local/bin/:$PATH"


export VAGRANT_DEFAULT_PROVIDER=libvirt

alias k=kubectl
alias kk='k -n kube-system '
alias ki='k -n infra '
alias k1='k -n 1pt '

function kiclogs() {
  kubectl -n $2 get po $1 -o jsonpath={.spec.initContainers[*].name} | xargs -d' ' -I CONTAINER kubectl -n $2 logs --limit-bytes=${3:-2000} $1 -c CONTAINER
}

function pokill() {
  pods=$(kubectl -n $2 get po -o name | grep $1)
  echo "$pods" | xargs -I POD kubectl -n $2 delete --force --grace-period 0 POD
}

