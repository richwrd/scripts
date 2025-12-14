#!/bin/bash

# Configure .zshrc with plugins

configure_zshrc() {
    log_info "Configuring .zshrc..."
    
    # Check if plugins are already configured
    if grep -q "plugins=(git sudo history zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-shift-select)" "$HOME/.zshrc"; then
        log_info "Plugins are already configured in .zshrc. No changes needed."
        return 0
    fi
    
    # Create backup before modifying
    if [ -f "$HOME/.zshrc" ]; then
        local backup_file="$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$HOME/.zshrc" "$backup_file"
        log_info "Backup created: $backup_file"
    fi
    
    # Update plugins in .zshrc
    sed -i '/^plugins=(git)/c\plugins=(git sudo history zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-shift-select)' "$HOME/.zshrc"
    
    if grep -q "plugins=(git sudo history zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-shift-select)" "$HOME/.zshrc"; then
        log_success "Plugins enabled successfully in .zshrc"
    else
        log_warning "Could not verify if plugins were enabled. Please check the .zshrc file manually"
    fi
}
