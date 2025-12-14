#!/bin/bash

# Install and update Oh My Zsh

install_ohmyzsh() {
    log_info "Checking Oh My Zsh..."
    
    if [ -d "$HOME/.oh-my-zsh" ]; then
        log_info "Oh My Zsh is already installed. Updating..."
        if [ -f "$HOME/.oh-my-zsh/tools/upgrade.sh" ]; then
            env ZSH="$HOME/.oh-my-zsh" sh "$HOME/.oh-my-zsh/tools/upgrade.sh" > /dev/null 2>&1 && \
                log_success "Oh My Zsh updated." || \
                log_info "Oh My Zsh is already at the latest version."
        fi
    else
        log_info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        log_success "Oh My Zsh installed successfully."
    fi
}
