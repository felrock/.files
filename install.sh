#!/usr/bin/env bash
set -euo pipefail

if [[ "${EUID}" -ne 0 ]]; then
  echo "Please run as root (e.g. with sudo)."
  exit 1
fi

DOTFILES_REPO_URL="${DOTFILES_REPO_URL:-https://github.com/felrock/.files.git}"
DOTFILES_REF="${DOTFILES_REF:-master}"

# Keep user config in the invoking user's home when run via sudo.
TARGET_USER="${SUDO_USER:-root}"
TARGET_HOME="$(eval echo "~${TARGET_USER}")"
ZSHRC_PATH="${TARGET_HOME}/.zshrc"
NVIM_DATA_DIR="${TARGET_HOME}/.local/share/nvim"
PACKER_DIR="${NVIM_DATA_DIR}/site/pack/packer/start/packer.nvim"
tmpdir="$(mktemp -d)"
trap 'rm -rf "${tmpdir}"' EXIT
DOTFILES_DIR="${tmpdir}/dotfiles"

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y \
  cmake \
  gcc \
  clang \
  clangd \
  git \
  curl \
  zsh \
  fzf \
  tmux \
  btop \
  locales \
  xclip \
  xsel \
  wl-clipboard \
  python3-pylsp \
  python3-pynvim \
  zoxide \
  ripgrep \
  fd-find

ZSH_PATH="$(command -v zsh)"
update-locale LANG=C.UTF-8 LC_CTYPE=C.UTF-8

# Install Neovim (stable).
curl -fsSL "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz" \
  -o "${tmpdir}/nvim-linux-x86_64.tar.gz"
tar -xzf "${tmpdir}/nvim-linux-x86_64.tar.gz" -C "${tmpdir}"
cp -f "${tmpdir}/nvim-linux-x86_64/bin/"* /usr/bin/
cp -rf "${tmpdir}/nvim-linux-x86_64/lib/"* /usr/lib/
cp -rf "${tmpdir}/nvim-linux-x86_64/share/"* /usr/share/

# Install CLI tools used by Neovim plugins and LSP config.
curl -fsSL "https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz" \
  -o "${tmpdir}/tree-sitter-linux-x64.gz"
gzip -dc "${tmpdir}/tree-sitter-linux-x64.gz" > "${tmpdir}/tree-sitter"
install -m 0755 "${tmpdir}/tree-sitter" /usr/local/bin/tree-sitter

curl -fsSL "https://github.com/artempyanykh/marksman/releases/latest/download/marksman-linux-x64" \
  -o "${tmpdir}/marksman"
install -m 0755 "${tmpdir}/marksman" /usr/local/bin/marksman

if [[ -n "${BASH_SOURCE[0]:-}" && -f "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  if [[ -d "${SCRIPT_DIR}/nvim" && -f "${SCRIPT_DIR}/tmux/.tmux.conf" ]]; then
    DOTFILES_DIR="${SCRIPT_DIR}"
  fi
fi

if [[ ! -d "${DOTFILES_DIR}/nvim" || ! -f "${DOTFILES_DIR}/tmux/.tmux.conf" ]]; then
  git clone --depth 1 --branch "${DOTFILES_REF}" "${DOTFILES_REPO_URL}" "${DOTFILES_DIR}"
fi

# Install packer.nvim for Neovim plugins.
install -d "$(dirname "${PACKER_DIR}")"
if [[ ! -e "${PACKER_DIR}" ]]; then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim "${PACKER_DIR}"
elif [[ ! -d "${PACKER_DIR}/.git" ]]; then
  echo "Packer path exists but is not a git checkout: ${PACKER_DIR}"
  exit 1
fi

# Ensure shell aliases/hooks exist without duplicating lines.
touch "${ZSHRC_PATH}"
grep -qxF 'export LANG=C.UTF-8' "${ZSHRC_PATH}" || echo 'export LANG=C.UTF-8' >> "${ZSHRC_PATH}"
grep -qxF 'export LC_CTYPE=C.UTF-8' "${ZSHRC_PATH}" || echo 'export LC_CTYPE=C.UTF-8' >> "${ZSHRC_PATH}"
grep -qxF 'alias vim="nvim"' "${ZSHRC_PATH}" || echo 'alias vim="nvim"' >> "${ZSHRC_PATH}"
grep -qxF 'eval "$(zoxide init zsh)"' "${ZSHRC_PATH}" || echo 'eval "$(zoxide init zsh)"' >> "${ZSHRC_PATH}"

# Copy config files.
install -d "${TARGET_HOME}/.config"
rm -rf "${TARGET_HOME}/.config/nvim"
cp -r "${DOTFILES_DIR}/nvim" "${TARGET_HOME}/.config/nvim"
cp -f "${DOTFILES_DIR}/tmux/.tmux.conf" "${TARGET_HOME}/.tmux.conf"
chown -R "${TARGET_USER}:${TARGET_USER}" "${TARGET_HOME}/.config/nvim" "${TARGET_HOME}/.tmux.conf" "${ZSHRC_PATH}" "${NVIM_DATA_DIR}"

# Use zsh as the target user's login shell.
CURRENT_SHELL="$(getent passwd "${TARGET_USER}")"
CURRENT_SHELL="${CURRENT_SHELL##*:}"
if [[ "${CURRENT_SHELL}" != "${ZSH_PATH}" ]]; then
  chsh -s "${ZSH_PATH}" "${TARGET_USER}"
fi
