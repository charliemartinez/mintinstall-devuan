#!/bin/bash
# ==============================================================
# Nombre:            mintinstall-devuan.sh
# Autor:             Charlie Martínez® <cmartinez@quirinux.org>
# Licencia:          https://www.gnu.org/licenses/gpl-3.0.txt
# Utilidad:          Configurar APT para instalar solo mintinstall desde el repositorio de Quirinux
# Distro:            Quirinux 2.x (Devuan Daedalus)
# ==============================================================

set -e

echo "=== Instalando clave y repositorio oficial de Quirinux ==="

# Descargar e instalar quirinux-keyring
wget -q https://repo.quirinux.org/pool/main/q/quirinux-keyring/quirinux-keyring_1.0.1_all.deb -O /tmp/quirinux-keyring.deb
sudo dpkg -i /tmp/quirinux-keyring.deb

# Descargar e instalar quirinux-repo
wget -q https://repo.quirinux.org/pool/main/q/quirinux-repo/quirinux-repo_1.1.1_all.deb -O /tmp/quirinux-repo.deb
sudo dpkg -i /tmp/quirinux-repo.deb

echo "=== Actualizando índices de APT ==="
sudo apt update

echo "=== Configurando APT pinning para permitir solo mintinstall y sus dependencias ==="

PREF_FILE="/etc/apt/preferences.d/quirinux"
sudo tee "$PREF_FILE" > /dev/null <<'EOF'
###############################################################
# Bloquear todos los paquetes del repo Quirinux
###############################################################
Package: *
Pin: origin "repo.quirinux.org"
Pin-Priority: 1



###############################################################
# Permitir instalar mintinstall desde Quirinux SIEMPRE
###############################################################
Package: mintinstall
Pin: origin "repo.quirinux.org"
Pin-Priority: 1001



###############################################################
# Permitir instalar dependencias de mintinstall SOLO si
# no existen en Devuan o las versiones de Quirinux son necesarias
###############################################################
Package: *
Pin: origin "repo.quirinux.org"
Pin-Priority: 500
EOF

echo "Archivo de preferencias creado en $PREF_FILE"

echo "=== Verificando configuración ==="
apt-cache policy mintinstall | grep -E "Candidate|repo.quirinux.org" || true

echo ""
echo "Configuración completa."
echo ""
echo "Puedes instalar mintinstall con:"
echo "    sudo apt install mintinstall"
echo ""
