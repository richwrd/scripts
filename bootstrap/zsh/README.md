# Bootstrap Zsh

Modular and automated installer for Zsh with Oh My Zsh and essential plugins.

## 📋 What this installer does

This script automates the complete setup of a professional Zsh environment, including:

1. **Base package installation**
   - Git
   - Zsh
   - Curl

2. **Oh My Zsh**
   - Framework for managing Zsh configurations
   - Silent and automated installation
   - Automatic updates on subsequent runs

3. **Installed plugins**
   - `zsh-autosuggestions` - Automatic suggestions based on history
   - `zsh-syntax-highlighting` - Real-time syntax highlighting
   - `fast-syntax-highlighting` - Optimized version of syntax highlighting
   - `zsh-autocomplete` - Advanced autocomplete
   - `zsh-shift-select` - Text selection with Shift

4. **Automatic configuration**
   - Enables all plugins in `.zshrc`
   - Creates backups before modifying configurations
   - Sets Zsh as the system's default shell

## 🏗️ Architecture

```
bootstrap/zsh/
├── setup.sh                # Main script (installs and updates)
├── steps/                  # Installation modules
│   ├── 01-install-packages.sh
│   ├── 02-install-ohmyzsh.sh
│   ├── 03-install-plugins.sh
│   ├── 04-configure-zshrc.sh
│   └── 05-set-default-shell.sh
└── README.md
```

### Core modules used

- `core/log.sh` - Colored logging system
- `core/os-detect.sh` - Automatic OS detection (Debian/RedHat)

## 🚀 How to use

### Direct execution

```bash
# Make the script executable (first time)
chmod +x bootstrap/zsh/setup.sh

# Run the setup script
./bootstrap/zsh/setup.sh

# Or execute with bash
bash bootstrap/zsh/setup.sh
```

### Idempotent execution

The script can be run **multiple times safely**:

- ✅ Does not reinstall already installed packages
- ✅ Updates Oh My Zsh and plugins automatically
- ✅ Does not duplicate configurations in `.zshrc`
- ✅ Does not change shell if already configured
- ✅ Creates backups before modifications

### First execution

```
[INFO] Operating system detected: debian
[INFO] Updating repositories...
[INFO] Installing Git and Zsh...
[OK] Base packages installed successfully.
[INFO] Installing Oh My Zsh...
[OK] Oh My Zsh installed successfully.
[INFO] Installing plugin zsh-autosuggestions...
[OK] Plugin zsh-autosuggestions installed.
...
[OK] Installation completed successfully!
```

### Subsequent executions (maintenance)

```
[INFO] Operating system detected: debian
[INFO] Oh My Zsh is already installed. Updating...
[OK] Oh My Zsh updated.
[INFO] Plugin zsh-autosuggestions already installed. Updating...
[OK] Plugin zsh-autosuggestions updated.
[INFO] Plugins are already configured in .zshrc. No changes needed.
[INFO] Default shell is already Zsh. No changes needed.
[OK] Installation completed successfully!
```

## 🎯 Supported systems

- ✅ Debian / Ubuntu (apt)
- ✅ RedHat / CentOS / Fedora (yum)

## 🔒 Security

- Automatic timestamped backups of `.zshrc`
- Checks before each operation
- Clear messages about what is being done
- Execution with `set -e` (stops on first failure)

## 🛠️ Customization

### Add new plugins

Edit [steps/03-install-plugins.sh](steps/03-install-plugins.sh):

```bash
install_plugin "plugin-name" "https://github.com/user/repo.git"
```

And add it in [steps/04-configure-zshrc.sh](steps/04-configure-zshrc.sh):

```bash
plugins=(git sudo history your-new-plugin ...)
```

### Add new steps

Create a numbered file in `steps/` and import it in [setup.sh](setup.sh):

```bash
source "$SCRIPT_DIR/steps/06-your-new-step.sh"
```

## 📦 Dependencies

Minimum required to run the script:
- `bash`

Everything else is installed automatically.

## 🔄 Updates

To update Oh My Zsh and all plugins, simply run again:

```bash
bash bootstrap/zsh/setup.sh
```

The script detects existing installations and automatically pulls updates.

## 📝 Logs and Debug

All operations are logged to the terminal with color codes:

- 🔵 **[INFO]** - Progress information
- 🟢 **[OK]** - Successful operations
- 🟡 **[WARNING]** - Non-critical warnings
- 🔴 **[ERROR]** - Errors that prevent execution

## 🤝 Contributing

To improve this installer:

1. Add new modular steps in `steps/`
2. Maintain idempotency (checks before actions)
3. Use log functions from `core/log.sh`
4. Test across multiple runs
5. Document changes in this README

## 📄 License

Part of the automation scripts repository.

