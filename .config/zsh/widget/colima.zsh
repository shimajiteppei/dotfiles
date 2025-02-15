__DOTFILES_WIDGET_NAME=colima


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## init
    ##
    command -v docker >/dev/null || brew install docker
    command -v colima >/dev/null || brew install colima

    if ! $(colima status > /dev/null); then
        # colima start --arch x86_64 --cpu 4 --memory 12 --disk 40
        colima start --cpu 4 --memory 12 --disk 40 --arch aarch64 --vm-type=vz --vz-rosetta --mount-type virtiofs
    fi
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    # force delete colima vm
    colima delete
    pkill -f colima

    # reset colima config dir
    local __COLIMA_HOME=$HOME/.config/colima
    local __COLIMA_TEMPLATE=$__COLIMA_HOME/_templates
    rm -rf $__COLIMA_HOME
    mkdir -p $__COLIMA_TEMPLATE
    cat <<EOF > $__COLIMA_TEMPLATE/default.yaml 
# colima template setting
cpu: 4
disk: 20
memory: 12
arch: x86_64

vmType: qemu
rosetta: false
nestedVirtualization: false
cpuType: ""

mountType: sshfs
mountInotify: true
mounts: []

env: {}

autoActivate: true

sshConfig: true
sshPort: 0

runtime: docker
docker: {}

kubernetes:
  enabled: false
  version: v1.31.2+k3s1
  k3sArgs:
    - --disable=traefik

hostname: ""

network:
  address: false
  dns: []
  dnsHosts: {}
  hostAddresses: false

forwardAgent: false

provision:
  - mode: system
    # https://github.com/abiosoft/colima/issues/131#issuecomment-1911538258
    script: |
      cd /etc/ssl/certs
      openssl s_client -showcerts -connect gcr.io:443 < /dev/null | awk "/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/ {if (/-----BEGIN CERTIFICATE-----/) {if (out) close(out); out=\"certificate_mitm_\" ++n \".pem\"}; print > out}"
      update-ca-certificates --fresh
EOF

    # reset docker symlink
    brew unlink docker && brew link docker

    # start colima vm
    colima start --cpu 4 --memory 12 --disk 40 --arch aarch64 --vm-type=vz --vz-rosetta --mount-type virtiofs
    # colima start --arch x86_64 --cpu 4 --memory 12 --disk 40
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
