#!/bin/bash
# ==============================================================
# Nombre:			mintinstall-devuan.sh
# Autor:			Charlie Martínez® <cmartinez@quirinux.org>
# Licencia:			https://www.gnu.org/licenses/gpl-3.0.txt
# Utilidad:			Configurar APT para instalar solo mintinstall desde el repositorio de Quirinux
# Distro:			Quirinux 2.x (Devuan Daedalus)
# ==============================================================

set -e

echo "=== Instalando clave y repositorio oficial de Quirinux ==="

# Descargar e instalar quirinux-keyring (firma GPG)
wget -q https://repo.quirinux.org/pool/main/q/quirinux-keyring/quirinux-keyring_1.0_all.deb -O /tmp/quirinux-keyring.deb
sudo dpkg -i /tmp/quirinux-keyring.deb

# Descargar e instalar quirinux-repo (añade el sources.list.d)
wget -q https://repo.quirinux.org/pool/main/q/quirinux-repo/quirinux-repo_1.1.1_all.deb -O /tmp/quirinux-repo.deb
sudo dpkg -i /tmp/quirinux-repo.deb

echo "=== Actualizando índices de APT ==="
sudo apt update

echo "=== Detectando campo de release del repo de Quirinux ==="
RELEASE_FIELD=$(apt-cache policy | grep -A1 'repo.quirinux.org' | grep "release" | awk '{print $2}' | cut -d'=' -f1 | head -n1)

if [ -z "$RELEASE_FIELD" ]; then
    echo "No se detectó el campo release; usaremos 'origin' como valor por defecto."
    RELEASE_FIELD="origin"
fi

echo "Campo de release detectado: $RELEASE_FIELD"

echo "=== Configurando APT pinning para permitir solo mintinstall ==="

PREF_FILE="/etc/apt/preferences.d/quirinux"
sudo tee "$PREF_FILE" > /dev/null <<EOF
Package: *
Pin: $RELEASE_FIELD "repo.quirinux.org"
Pin-Priority: 100

Package: mintinstall
Pin: $RELEASE_FIELD "repo.quirinux.org"
Pin-Priority: 1001
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
echo "APT usará el repositorio de Quirinux solo para ese paquete y sus dependencias necesarias."
