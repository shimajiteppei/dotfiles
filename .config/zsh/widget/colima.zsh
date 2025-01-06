__DOTFILES_WIDGET_NAME=colima


##
## env (envs must be loaded in main thread)
##
path=($path
    
)
typeset -U path PATH
export PATH


##
## init
##
"__dotfiles_widget-init-${__DOTFILES_WIDGET_NAME}"() {
    ##
    ## init
    ##
    if ! $(colima status); then
        # colima start --arch x86_64 --cpu 4 --memory 12 --disk 20
        colima start --cpu 4 --memory 12 --disk 20 --arch aarch64 --vm-type=vz --vz-rosetta --mount-type virtiofs
    fi
}


##
## update
##
"__dotfiles_widget-update-${__DOTFILES_WIDGET_NAME}"() {
    # colima
    colima delete
    pkill -f colima
    rm -rf $HOME/.config/colima
    mkdir -p $HOME/.config/colima/_templates
    cat <<EOF > $HOME/.config/zsh/widget/default.yaml
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
    ln -sf $HOME/.config/zsh/widget/default.yaml $HOME/.config/colima/_templates/default.yaml 
    brew unlink docker && brew link docker
    docker buildx install
    # colima start --arch x86_64 --cpu 4 --memory 12 --disk 20
    colima start --cpu 4 --memory 12 --disk 20 --arch aarch64 --vm-type=vz --vz-rosetta --mount-type virtiofs
}


##
## clean
##
"__dotfiles_widget-clean-${__DOTFILES_WIDGET_NAME}"() {
}


unset __DOTFILES_WIDGET_NAME
