#!/bin/bash

# Set Zsh as default shell

set_default_shell() {
    log_info "Checking default shell..."
    
    local zsh_path=$(which zsh)
    
    if [ -z "$zsh_path" ]; then
        log_error "Zsh not found on the system."
        return 1
    fi
    
    # Check if the shell is already zsh
    local current_shell=$(getent passwd "$USER" | cut -d: -f7)
    
    if [ "$current_shell" = "$zsh_path" ]; then
        log_info "Default shell is already Zsh. No changes needed."
        return 0
    fi
    
    log_info "Setting default shell to Zsh..."
    sudo chsh -s "$zsh_path" "$USER"
    log_success "Default shell changed to Zsh."
}
