#!/bin/bash
# ==============================================
#          MENÚ PRINCIPAL — FENIX-SCR
#             Fenix 3815569765
# ==============================================

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

  # Contadores de usuarios
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
  ██████╗ ██╗  ██╗███████╗███╗   ██╗██╗██╗  ██╗
  ██╔══██╗██║  ██║██╔════╝████╗  ██║██║╚██╗██╔╝
  ██████╔╝███████║█████╗  ██╔██╗ ██║██║ ╚███╔╝ 
  ██╔═══╝ ██╔══██║██╔══╝  ██║╚██╗██║██║ ██╔██╗ 
  ██║     ██║  ██║███████╗██║ ╚████║██║██╔╝ ██╗
  ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝
        PHENIX : Fenix 3815569765
"

  echo -e "         Fenix 3815569765
 ╔══════════════════════════════════════════════════════════╗
  S.O:    $SISTEMA           Fecha:  $FECHA
  IP:     $IP                 Hora:   $HORA
╠═════════════════Disc═════════════════╦════════CPU════════╣
  Total:  ${DISCO_TOTAL}GB    Dispo:  ${DISCO_LIBRE}GB     Cores:  $NUCLEOS
  En Uso: ${DISCO_USO}GB     Libre:  ${DISCO_LIBRE}GB     En Uso: ${CPU_USO}%
╠═══════════════════════════ram════════╩═══════════════════╣
  Total:  ${RAM_TOTAL}MB     En Uso: ${RAM_USO}MB    Libre:  ${RAM_LIBRE}MB
  Buffer: ${BUFFER}MB   Cache:  ${CACHE}MB
╚══════════════════════════════════════════════════════════╝
    ACTIVA: $ACTIVA   EXPIRADA: $EXPIRADA   BLOQUEADA: $BLOQUEADA   TOTAL: $TOTAL
════════════════════════════════════════════════════════════
  [1]> ADMINISTRAR CUENTAS (SSH/DROPBEAR)
------------------------------------------------------------
  [2]> CONFIGURACION DE PROTOCOLOS
  [3]> HERRAMIENTAS EXTRAS
------------------------------------------------------------
  [4]> FUNCIONES ESPECIALES
------------------------------------------------------------
  [5]> CONFIGURACION DEL SCRIPT
  [6]> ACTUALIZACIONES DISPONIBLES
------------------------------------------------------------
  [7]> [!] DESINSTALAR PANEL
════════════════════════════════════════════════════════════
  [0] SALIR DEL SCRIPT   [8] SALIR DEL VPS   [9] REINICIAR VPS
════════════════════════════════════════════════════════════
 Ingresa una Opcion: \c"

  read opcion
  case "$opcion" in
    0) echo -e "\nSaliendo..."; exit 0 ;;
    1) echo -e "\nOpción [1] — ADMINISTRAR CUENTAS\nEn desarrollo..."; sleep 2 ;;
    2) echo -e "\nOpción [2] — CONFIGURACION DE PROTOCOLOS\nEn desarrollo..."; sleep 2 ;;
    3) echo -e "\nOpción [3] — HERRAMIENTAS EXTRAS\nEn desarrollo..."; sleep 2 ;;
    4) echo -e "\nOpción [4] — FUNCIONES ESPECIALES\nEn desarrollo..."; sleep 2 ;;
    5) echo -e "\nOpción [5] — CONFIGURACION DEL SCRIPT\nEn desarrollo..."; sleep 2 ;;
    6) echo -e "\nOpción [6] — ACTUALIZACIONES\nEn desarrollo..."; sleep 2 ;;
    7) echo -e "\nOpción [7] — DESINSTALAR PANEL\nEn desarrollo..."; sleep 2 ;;
    8) echo -e "\nCerrando sesión..."; exit 0 ;;
    9) echo -e "\nReiniciando VPS..."; reboot ;;
    *) echo -e "\nOpción inválida"; sleep 1.5 ;;
  esac
done
