#!/bin/bash

set -e

# Base script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Import core modules
source "$PROJECT_ROOT/core/log.sh"
source "$PROJECT_ROOT/core/os-detect.sh"

# Import steps
source "$SCRIPT_DIR/steps/01-install-packages.sh"
source "$SCRIPT_DIR/steps/02-install-ohmyzsh.sh"
source "$SCRIPT_DIR/steps/03-install-plugins.sh"
source "$SCRIPT_DIR/steps/04-configure-zshrc.sh"
source "$SCRIPT_DIR/steps/05-set-default-shell.sh"

# Main function
main() {
    log_info "Starting Zsh installation with Oh My Zsh..."
    
    # Detect operating system
    detect_os
    
    # Execute installation steps
    install_base_packages
    install_ohmyzsh
    install_zsh_plugins
    configure_zshrc
    set_default_shell
    
    log_success "Installation completed successfully!"
    
    # Final instructions
    echo ""
    echo "To load the new configurations you can:"
    echo "  1. Close and reopen the terminal"
    echo "  2. Run: source ~/.zshrc"
    echo "  3. Run: exec zsh"
    echo ""
    
    # Offer option to start zsh
    read -p "Would you like to start a new zsh session now? (y/n): " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        log_info "Starting new zsh session..."
        exec zsh -l
    else
        log_info "Remember to reload your terminal to apply the changes."
    fi
}

# Execute installation
main
