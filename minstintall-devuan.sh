#!/bin/bash
# ==============================================================
# Nombre:            mintinstall-devuan.sh
# Autor:             Charlie Martínez® <cmartinez@quirinux.org>
# Licencia:          https://www.gnu.org/licenses/gpl-3.0.txt
# Utilidad:          Instala Centro de Software en Devuan
# Distro:            Quirinux 2.x (Devuan Daedalus / Excalibur)
# ==============================================================
# Ejecutar como ROOT (sin sudo)
# ==============================================================

# 1) Verificar que wget esté instalado
echo "[*] Verificando instalación de wget..."
if ! command -v wget >/dev/null 2>&1; then
    echo "[*] wget no está instalado. Instalando..."
    apt update
    apt install -y wget
else
    echo "[*] wget ya está instalado."
fi

# 2) Crear carpeta destino
DEST="/tmp/mintinstall"
mkdir -p "$DEST"

# Lista de URLs a descargar
URLS=(
"https://repo.quirinux.org/pool/main/a/aptdaemon/aptdaemon-data_1.1.1+bzr982-0ubuntu39mint1_all.deb"
"https://repo.quirinux.org/pool/main/a/aptdaemon/aptdaemon_1.1.4+bzr982-0ubuntu39mint1_all.deb"
"https://repo.quirinux.org/pool/main/a/aptdaemon/python3-aptdaemon.gtk3widgets_1.1.1+bzr982-0ubuntu39mint1_all.deb"
"https://repo.quirinux.org/pool/main/a/aptdaemon/python3-aptdaemon_1.1.1+bzr982-0ubuntu39mint1_all.deb"
"https://repo.quirinux.org/pool/main/p/python-defer/python3-defer_1.0.6+mint1_all.deb"
"https://repo.quirinux.org/pool/main/m/mint-common/mint-common_2.3.0_all.deb"
"https://repo.quirinux.org/pool/main/m/mint-translations/mint-translations_2023.07.07_all.deb"
"https://repo.quirinux.org/pool/main/m/mintinstall/mintinstall_8.4.4_all.deb"
"https://repo.quirinux.org/pool/main/a/app-install-data-ubuntu/app-install-data_15.12_all.deb"
"https://repo.quirinux.org/pool/main/f/flatpakconfig/flatpakconfig_1.3.0_all.deb"
)

echo "[*] Descargando paquetes .deb..."
for url in "${URLS[@]}"; do
    wget -P "$DEST" "$url"
done

# 3) Instalar los .deb exactamente como solicitaste:
echo "[*] Instalando paquetes..."
apt install -y /tmp/mintinstall/.*.deb

echo "[*] Proceso completado."
