# Scripts Collection

![Status](https://img.shields.io/badge/status-active-success)
![Scripts](https://img.shields.io/badge/scripts-1%20available-blue)
![License](https://img.shields.io/badge/license-MIT-green)

A curated collection of automation scripts for Linux system administration and configuration. This repository provides production-ready tools for various scenarios, from initial setup to advanced infrastructure operations.

---

## 📑 Table of Contents

- [Project Structure](#project-structure)
- [Available Scripts](#available-scripts)
- [Installation & Usage](#installation--usage)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [License](#license)
- [Disclaimer](#disclaimer)

---

## 📂 Project Structure

```
scripts/
│
├── bootstrap/          # Initial system configuration
│   └── zsh/           ✅ Available
│
├── infra/             # Infrastructure deployment & configuration
│   └── k3s/           🔜 Coming soon
│
├── db/                # Database maintenance & operations
│   └── backup/        🔜 Coming soon
│
└── security/          # System hardening & security
  └── hardening/     🔜 Coming soon
```

---

## 🚀 Available Scripts

### Bootstrap

Scripts for initial configuration of development environments and servers.

#### ZSH Setup
**Location:** [`bootstrap/zsh/setup.sh`](bootstrap/zsh/setup.sh)

Automated script for Zsh installation and configuration with Oh My Zsh, including essential plugins and optimized themes.

**Features:**
- Complete Zsh and Oh My Zsh installation
- Pre-configured plugins: `zsh-autosuggestions`, `zsh-syntax-highlighting`
- Powerlevel10k theme
- Intelligent auto-completion
- Persistent configuration

**Usage:**
```bash
cd bootstrap/zsh
chmod +x setup.sh
./setup.sh
```

**Requirements:**
- OS: Ubuntu/Debian (adaptable to other distros)
- Privileges: sudo
- Estimated time: ~5 minutes

---

## 💻 Installation & Usage

### Prerequisites
- Linux system (Ubuntu/Debian recommended)
- Git installed
- sudo access

### Clone Repository
```bash
git clone <repository-url>
cd scripts
```

### Running Scripts
Each category has its own documentation. Navigate to the desired directory and follow the specific instructions in the local README.

```bash
cd <category>/<script>
./setup.sh
```

---

## 🗓️ Roadmap

| Category | Script | Status | Priority |
|----------|--------|--------|----------|
| Bootstrap | ZSH Setup | ✅ Complete | - |
| Bootstrap | Tmux Config | 📋 Planned | High |
| Infra | K3s Installation | 🚧 In progress | High |
| Database | PostgreSQL Backup | 📋 Planned | High |
| Security | System Hardening | 📋 Planned | High |

**Legend:**
- ✅ Complete and tested
- 🚧 In development
- 📋 Planned
- 🔄 Under review

---

## 🤝 Contributing

Contributions are welcome! If you have a useful script or improvements to existing ones, feel free to contribute.

### How to Contribute

1. Fork the project
2. Create a feature branch (`git checkout -b feature/NewScript`)
3. Commit your changes (`git commit -m 'Add: change description'`)
4. Push to the branch (`git push origin feature/NewScript`)
5. Open a Pull Request

### Guidelines

- Each script must have its own README with clear instructions
- Include appropriate error handling
- Test in a controlled environment before submitting
- Document dependencies and requirements
- Follow project code conventions

---

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## ⚠️ Disclaimer

**IMPORTANT:** These scripts perform system modifications. Always:
- Review the code before execution
- Test in non-production environments first
- Backup important configurations
- Execute only on systems you administer
- Verify compatibility with your distribution

Scripts are provided "as is", without warranties. Use in production environments is at your own risk.

---

<div align="center">

**Built for the Linux community**

[@richwrd](https://github.com/richwrd)

</div>