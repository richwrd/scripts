#!/bin/bash

set -e

# Detectar o sistema operacional
if [ -f /etc/debian_version ]; then
    OS="debian"
    INSTALL_CMD="sudo apt install -y"
    UPDATE_CMD="sudo apt update"
elif [ -f /etc/redhat-release ]; then
    OS="redhat"
    INSTALL_CMD="sudo yum install -y"
else
    echo "Sistema operacional não suportado."
    exit 1
fi

# Atualizar os repositórios
echo "[INFO] Atualizando repositórios..."
$UPDATE_CMD


# Instalar Git e Zsh
echo "[INFO] Instalando Git e Zsh..."
$INSTALL_CMD git zsh curl


# Instalar Oh My Zsh
echo "[INFO] Instalando Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "[INFO] Oh My Zsh já está instalado."
else
    # Instalação silenciosa do Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Instalar Zsh Plugins
echo "[INFO] Instalando plugins Zsh..."
$INSTALL_CMD zsh-autosuggestions zsh-syntax-highlighting


# Instalar plugins adicionais do Zsh
echo "[INFO] Instalando plugins adicionais do Zsh..."

# Plugin zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    echo "[INFO] Instalando plugin zsh-autosuggestions..."
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "[INFO] Plugin zsh-autosuggestions já instalado."
fi

# Plugin zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "[INFO] Instalando plugin zsh-syntax-highlighting..."
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "[INFO] Plugin zsh-syntax-highlighting já instalado."
fi

# Plugin fast-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting" ]; then
    echo "[INFO] Instalando plugin fast-syntax-highlighting..."
    sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
else
    echo "[INFO] Plugin fast-syntax-highlighting já instalado."
fi

# Plugin zsh-autocomplete
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete" ]; then
    echo "[INFO] Instalando plugin zsh-autocomplete..."
    sudo git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autocomplete
else
    echo "[INFO] Plugin zsh-autocomplete já instalado."
fi

# Plugin zsh-shift-select
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-shift-select" ]; then
    echo "[INFO] Instalando plugin zsh-shift-select..."
    sudo git clone https://github.com/jirutka/zsh-shift-select.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-shift-select
else
    echo "[INFO] Plugin zsh-shift-select já instalado."
fi

# Alterar o arquivo .zshrc para habilitar os plugins
echo "[INFO] Habilitando plugins no .zshrc..."

# Criar backup do .zshrc antes de modificar
cp ~/.zshrc ~/.zshrc.backup

# Editando .zshrc para adicionar os plugins
sed -i '/^plugins=(git)/c\plugins=(git sudo history zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-shift-select)' ~/.zshrc


if grep -q "plugins=(git sudo history zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-shift-select)" ~/.zshrc; then
    echo "[INFO] Plugins habilitados com sucesso."
else
    echo "[ERROR] Falha ao habilitar plugins."
fi

# Definir o shell padrão como Zsh
echo "[INFO] Alterando shell padrão para Zsh..."
sudo chsh -s "$(which zsh)"

echo "[OK] Instalação concluída."
echo "Para carregar as novas configurações você pode:"
echo "  1. Fechar e abrir o terminal novamente"
echo "  2. Executar: source ~/.zshrc"
echo "  3. Executar: exec zsh"

# Oferecer opção para iniciar uma nova sessão de zsh imediatamente
read -p "Deseja iniciar uma nova sessão de zsh agora? (s/n): " choice
if [[ "$choice" == "s" || "$choice" == "S" ]]; then
    echo "Iniciando nova sessão zsh..."
    exec zsh -l
else
    echo "Lembre-se de recarregar seu terminal para aplicar as alterações."
fi
