# mintinstall-devuan.sh

**Autor:** Charlie Martínez® (<cmartinez@quirinux.org>)  
**Licencia:** [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.txt)  

## Descripción

`mintinstall-devuan.sh` es un script diseñado para **configurar APT** de manera que permita instalar **solo el paquete `mintinstall`** desde el repositorio oficial de Quirinux, junto con sus dependencias necesarias.  

El paquete `mintinstall` desde el repositorio de Quirinux es una versión modificada por Charlie Martínez del Centro de Software oficial de **Linux Mint**, el único hasta la fecha que funciona 100% sobre el sistema Devuan. Esta versión modificada del paquete fue realizada originalmente para el sistema **Quirinux** y elimina la dependencia de SystemD.

Este script está pensado para los sistemas **Devuan Daedalus 5** y **Devuan Excalibur 6** y garantiza que **el resto de los paquetes permanezcan en los repositorios oficiales de Devuan**, evitando conflictos o instalaciones indeseadas desde Quirinux.

---

## Funcionalidades principales

- Añade la **clave GPG** oficial de Quirinux.  
- Configura el **repositorio Quirinux** en el sistema.  
- Aplica un **pinning de APT** para que solo `mintinstall` y sus dependencias se instalen desde Quirinux.  
- Mantiene la integridad del resto del sistema usando los repositorios Devuan para todos los demás paquetes.  

---

## Uso

```bash
# Descargar el script
wget https://repo.quirinux.org/scripts/mintinstall-devuan.sh -O mintinstall-devuan.sh

# Hacerlo ejecutable
chmod +x mintinstall-devuan.sh

# Ejecutarlo (requiere permisos de administración)
./mintinstall-devuan.sh

# Instalar mintinstall desde el repositorio de Quirinux (requiere permisos de administración)
apt-get install --no-install-recommends mintinstall

