#!/bin/bash

# Detectar sistema operacional e configurar comandos

detect_os() {
    if [ -f /etc/debian_version ]; then
        export OS="debian"
        export INSTALL_CMD="sudo apt install -y"
        export UPDATE_CMD="sudo apt update"
    elif [ -f /etc/redhat-release ]; then
        # Detectar se é CentOS, RedHat, Fedora, etc
        if grep -qi "centos" /etc/redhat-release; then
            export OS="centos"
        elif grep -qi "fedora" /etc/redhat-release; then
            export OS="fedora"
        else
            export OS="redhat"
        fi
        
        # Verificar se usa dnf ou yum
        if command -v dnf &> /dev/null; then
            export INSTALL_CMD="sudo dnf install -y"
            export UPDATE_CMD="sudo dnf update -y"
        else
            export INSTALL_CMD="sudo yum install -y"
            export UPDATE_CMD="sudo yum update -y"
        fi
    else
        log_error "Sistema operacional não suportado."
        exit 1
    fi
    
    log_info "Sistema operacional detectado: $OS"
}
