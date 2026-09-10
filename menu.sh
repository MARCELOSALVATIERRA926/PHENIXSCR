#!/bin/bash
# ==============================================
#          MENÚ PRINCIPAL — FENIX-SCR
#             Fenix 3815569765
# ==============================================

# === COLORES ===
N="\033[0m"      # Normal
B="\033[1;37m"  # Blanco brillante
A="\033[1;33m"  # Amarillo / Dorado
V="\033[1;32m"  # Verde
R="\033[1;31m"  # Rojo
C="\033[1;36m"  # Cian / Turquesa
Az="\033[1;34m" # Azul
M="\033[1;35m"  # Magenta / Rosa

while true; do
  clear

  FECHA=$(date +"%d-%m-%Y")
  HORA=$(date +"%H:%M:%S")
  IP=$(hostname -I | awk '{print $1}')
  SISTEMA=$(lsb_release -d | cut -f2)

  # Espacio en disco
  DISCO_TOTAL=$(df -BG / | awk 'NR==2 {print $2}' | tr -d 'G')
  DISCO_USO=$(df -BG / | awk 'NR==2 {print $3}' | tr -d 'G')
  DISCO_LIBRE=$(df -BG / | awk 'NR==2 {print $4}' | tr -d 'G')

  # RAM
  RAM_TOTAL=$(free -m | awk 'NR==2 {print $2}')
  RAM_USO=$(free -m | awk 'NR==2 {print $3}')
  RAM_LIBRE=$(free -m | awk 'NR==2 {print $4}')
  BUFFER=$(free -m | awk 'NR==2 {print $6}')
  CACHE=$(free -m | awk 'NR==2 {print $7}')

  # CPU
  CPU_USO=$(top -bn1 | grep 'Cpu(s)' | awk '{print 100 - $8}' | cut -d. -f1)
  NUCLEOS=$(nproc)

  # Contadores
  BD="/etc/FENIX-SCR/bd/usuarios.db"
  if [ -f "$BD" ]; then
    ACTIVA=$(sqlite3 "$BD" "SELECT COUNT(*) FROM usuarios WHERE estado='activo';" 2>/dev/null || echo "0")
    EXPIRADA=$(sqlite3 "$BD" "SELECT COUNT(*) FROM usuarios WHERE estado='vencido';" 2>/dev/null || echo "0")
    BLOQUEADA=$(sqlite3 "$BD" "SELECT COUNT(*) FROM usuarios WHERE estado='bloqueado';" 2>/dev/null || echo "0")
    TOTAL=$(sqlite3 "$BD" "SELECT COUNT(*) FROM usuarios;" 2>/dev/null || echo "0")
  else
    ACTIVA=0; EXPIRADA=0; BLOQUEADA=0; TOTAL=0
  fi

  echo -e "
${A}  ██████╗ ██╗  ██╗███████╗███╗   ██╗██╗██╗  ██╗${N}
${A}  ██╔══██╗██║  ██║██╔════╝████╗  ██║██║╚██╗██╔╝${N}
${A}  ██████╔╝███████║█████╗  ██╔██╗ ██║██║ ╚███╔╝ ${N}
${A}  ██╔═══╝ ██╔══██║██╔══╝  ██║╚██╗██║██║ ██╔██╗ ${N}
${A}  ██║     ██║  ██║███████╗██║ ╚████║██║██╔╝ ██╗${N}
${A}  ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝${N}
${M}        PHENIX : ${B}Fenix 3815569765${N}
"

  echo -e "         ${B}Fenix 3815569765${N}
${C}╔══════════════════════════════════════════════════════════╗${N}
  ${V}S.O:${N}    ${B}$SISTEMA${N}           ${V}Fecha:${N}  ${A}$FECHA${N}
  ${V}IP:${N}     ${B}$IP${N}                 ${V}Hora:${N}   ${A}$HORA${N}
${C}╠═════════════════${M}DISCO${C}═════════════════╦════${M}CPU${C}════════╣${N}
  ${V}Total:${N}  ${B}${DISCO_TOTAL}GB${N}    ${V}Libre:${N}  ${V}${DISCO_LIBRE}GB${N}     ${V}Núcleos:${N}  ${A}$NUCLEOS${N}
  ${V}En Uso:${N} ${R}${DISCO_USO}GB${N}     ${V}Dispo:${N}  ${V}${DISCO_LIBRE}GB${N}     ${V}En Uso:${N} ${R}${CPU_USO}%${N}
${C}╠════════════════════════${M}MEMORIA RAM${C}════════╩═══════════════════╣${N}
  ${V}Total:${N}  ${B}${RAM_TOTAL}MB${N}     ${V}En Uso:${N} ${R}${RAM_USO}MB${N}    ${V}Libre:${N}  ${V}${RAM_LIBRE}MB${N}
  ${V}Buffer:${N} ${Az}${BUFFER}MB${N}   ${V}Caché:${N}  ${Az}${CACHE}MB${N}
${C}╚══════════════════════════════════════════════════════════╝${N}
    ${V}ACTIVAS:${N} ${B}$ACTIVA${N}   ${A}EXPIRADAS:${N} ${A}$EXPIRADA${N}   ${R}BLOQUEADAS:${N} ${R}$BLOQUEADA${N}   ${M}TOTAL:${N} ${B}$TOTAL${N}
${C}════════════════════════════════════════════════════════════${N}
  ${A}[1]${N} ${V}ADMINISTRAR CUENTAS (SSH/DROPBEAR)${N}
${C}------------------------------------------------------------${N}
  ${A}[2]${N} ${V}CONFIGURACIÓN DE PROTOCOLOS${N}
  ${A}[3]${N} ${V}HERRAMIENTAS EXTRAS${N}
${C}------------------------------------------------------------${N}
  ${A}[4]${N} ${V}FUNCIONES ESPECIALES${N}
${C}------------------------------------------------------------${N}
  ${A}[5]${N} ${V}CONFIGURACIÓN DEL SCRIPT${N}
  ${A}[6]${N} ${V}ACTUALIZACIONES DISPONIBLES${N}
${C}------------------------------------------------------------${N}
  ${R}[7]${N} ${R}⚠️  DESINSTALAR PANEL${N}
${C}════════════════════════════════════════════════════════════${N}
  ${V}[0]${N} ${B}SALIR DEL SCRIPT${N}   ${Az}[8]${N} ${B}SALIR DE LA VPS${N}   ${R}[9]${N} ${R}REINICIAR VPS${N}
${C}════════════════════════════════════════════════════════════${N}
 ${B}Ingresá una opción: ${N}\c"

  read opcion
  case "$opcion" in
    0) echo -e "\n${V}Saliendo... ¡Hasta la próxima! ✅${N}"; exit 0 ;;
    1) echo -e "\n${A}Opción [1] — ${B}ADMINISTRAR CUENTAS${N}\n${M}En desarrollo...${N}"; sleep 2 ;;
    2) echo -e "\n${A}Opción [2] — ${B}CONFIGURACIÓN DE PROTOCOLOS${N}\n${V}Lista para configurar puertos y túneles ✅${N}"; sleep 2 ;;
    3) echo -e "\n${A}Opción [3] — ${B}HERRAMIENTAS EXTRAS${N}\n${M}En desarrollo...${N}"; sleep 2 ;;
    4) echo -e "\n${A}Opción [4] — ${B}FUNCIONES ESPECIALES${N}\n${M}En desarrollo...${N}"; sleep 2 ;;
    5) echo -e "\n${A}Opción [5] — ${B}CONFIGURACIÓN DEL SCRIPT${N}\n${M}En desarrollo...${N}"; sleep 2 ;;
    6) echo -e "\n${A}Opción [6] — ${B}ACTUALIZACIONES${N}\n${M}En desarrollo...${N}"; sleep 2 ;;
    7) echo -e "\n${R}Opción [7] — ⚠️ DESINSTALAR PANEL${N}\n${M}En desarrollo...${N}"; sleep 2 ;;
    8) echo -e "\n${Az}Cerrando sesión...${N}"; exit 0 ;;
    9) echo -e "\n${R}⚠️ Reiniciando VPS...${N}"; reboot ;;
    *) echo -e "\n${R}❌ Opción inválida. Intentá nuevamente${N}"; sleep 1.5 ;;
  esac
done
