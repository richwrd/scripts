#!/bin/bash

# Install base packages for Zsh

install_base_packages() {
    log_info "Updating repositories..."
    $UPDATE_CMD
    
    log_info "Installing Git, Zsh and Curl..."
    $INSTALL_CMD git zsh curl
    
    log_success "Base packages installed successfully."
}
