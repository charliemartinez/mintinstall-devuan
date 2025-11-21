# mintinstall-devuan.sh

**Autor:** Charlie Martínez® (<cmartinez@quirinux.org>)  
**Licencia:** [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0.txt)  

## Descripción

`mintinstall-devuan.sh` es un script que descarga todos los paquetes necesarios para instalar el Centro de Software de Mint desde el repositorio de Quirinux, donde ha sido modificado por Charlie Martínez para funcionar en distribuciones Devuan (es decir, sin SystemD). 

---

## Funcionalidades principales

- Verifica si está instalado wget y sino lo descarga y lo instala.
- Descarga todos los paquetes necesarios con wget, desde el repositorio de Quirinux.
- Guarda los paquetes en /tmp/mintinstall
- Instala los paquetes con apt install

---

## Uso

```bash
# Descargar el script
wget https://repo.quirinux.org/extras/scripts/mintinstall-devuan/mintinstall-devuan.sh

# Hacerlo ejecutable
chmod +x mintinstall-devuan.sh

# Ejecutarlo (requiere permisos de administración)
./mintinstall-devuan.sh


