#!/bin/bash

# Install and update Zsh plugins

install_plugin() {
    local plugin_name="$1"
    local plugin_url="$2"
    local plugin_path="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin_name"
    
    if [ ! -d "$plugin_path" ]; then
        log_info "Installing plugin $plugin_name..."
        git clone "$plugin_url" "$plugin_path"
        log_success "Plugin $plugin_name installed."
    else
        log_info "Plugin $plugin_name already installed. Updating..."
        local update_output=$(cd "$plugin_path" && git pull 2>&1)
        
        if echo "$update_output" | grep -q "Already up to date"; then
            log_info "Plugin $plugin_name is already at the latest version."
        elif [ $? -eq 0 ]; then
            log_success "Plugin $plugin_name updated."
        else
            log_warning "Could not update $plugin_name."
        fi
    fi
}

install_zsh_plugins() {
    log_info "Installing Zsh plugins..."
    
    # Try to install system packages (may not be available on all systems)
    $INSTALL_CMD zsh-autosuggestions zsh-syntax-highlighting 2>/dev/null || true
    
    # Install plugins from GitHub
    install_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
    install_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
    install_plugin "fast-syntax-highlighting" "https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
    install_plugin "zsh-autocomplete" "https://github.com/marlonrichert/zsh-autocomplete.git"
    install_plugin "zsh-shift-select" "https://github.com/jirutka/zsh-shift-select.git"
    
    log_success "Plugins installed successfully."
}
