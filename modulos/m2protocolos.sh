cat > /etc/FENIX-SCR/modulos/m2protocolos.sh << 'FIN'
#!/bin/bash
# ==============================================
#          ADMINISTRADOR DE PROTOCOLOS
#             Fenix 3815569765
# ==============================================

# === COLORES IGUALES AL ORIGINAL ===
N="\033[0m"
VERD="\033[1;32m"   # ON
VERM="\033[1;31m"   # OFF
AZU="\033[1;36m"    # Nombres
AMA="\033[1;33m"    # Títulos

# === ESTADOS IGUALES ===
ESTADO_DROPBEAR="\033[1;32m[ON] "
ESTADO_SOCKS="\033[1;32m[ON] "
ESTADO_SSL="\033[1;31m[OFF]"
ESTADO_V2RAY="\033[1;31m[OFF]"
ESTADO_WS="\033[1;31m[OFF]"
ESTADO_BADVPN="\033[1;31m[OFF]"
ESTADO_SQUID="\033[1;31m[OFF]"
ESTADO_WIREGUARD="\033[1;31m[OFF]"
ESTADO_UDP="\033[1;31m[OFF]"
ESTADO_SLOWDNS="\033[1;31m[OFF]"
ESTADO_OPENVPN="\033[1;31m[OFF]"
ESTADO_PSIPHON="\033[1;31m[OFF]"
ESTADO_WSEPRO="\033[1;31m[OFF]"
ESTADO_CHECKUSER="\033[1;31m[OFF]"
ESTADO_TOKEN="\033[1;31m[OFF]"
ESTADO_HCRM="\033[1;32m[ON] "
ESTADO_SSHGO="\033[1;31m[OFF]"
ESTADO_SSH="\033[1;32m[ON] "
ESTADO_FILEBROWSER="\033[1;31m[OFF]"

while true; do
  clear
  echo -e "\e[36m══════════════════════════════════════════════════════════════\e[0m"
  echo -e "\e[1;35m                  Fenix 3815569765\e[0m"
  echo -e "\e[36m══════════════════════════════════════════════════════════════\e[0m"
  echo -e "\e[1;33m                ADMINISTRADOR DE PROTOCOLOS\e[0m"
  echo -e "\e[36m══════════════════════════════════════════════════════════════\e[0m"
  echo -e "  \e[1;32mDROPBEAR:\e[0m 90                  \e[1;32mPYTHON3:\e[0m 80"
  echo -e "  \e[1;32mSSH:\e[0m   22"
  echo -e "\e[36m══════════════════════════════════════════════════════════════\e[0m"

  # === EXACTAMENTE IGUAL AL ORIGINAL: echo -ne + echo -e ===
  echo -ne "$(echo -e "${VERD} [1]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}DROPBEAR      ${ESTADO_DROPBEAR}${N}")"
  echo -e "$(echo -e "${VERD}[10]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}WIREGUARD     ${ESTADO_WIREGUARD}${N}")"

  echo -ne "$(echo -e "${VERD} [2]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}SOCKS PYTHON  ${ESTADO_SOCKS}${N}")"
  echo -e "$(echo -e "${VERD}[11]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}UDP-CUSTOM    ${ESTADO_UDP}${N}")"

  echo -ne "$(echo -e "${VERD} [3]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}SSL/STUNNEL   ${ESTADO_SSL}${N}")"
  echo -e "$(echo -e "${VERD}[12]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}UDP-HYSTERIA  ${ESTADO_SLOWDNS}${N}")"

  echo -ne "$(echo -e "${VERD} [4]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}V2RAY/XRAY    ${ESTADO_V2RAY}${N}")"
  echo -e "$(echo -e "${VERD}[13]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}BADVPN-UDPGW  ${ESTADO_BADVPN}${N}")"

  echo -ne "$(echo -e "${VERD} [5]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}HCRM          ${ESTADO_HCRM}${N}")"
  echo -e "$(echo -e "${VERD}[14]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}SQUID         ${ESTADO_SQUID}${N}")"

  echo -ne "$(echo -e "${VERD} [6]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}SSHGO         ${ESTADO_SSHGO}${N}")"
  echo -e "$(echo -e "${VERD}[15]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}OPENVPN       ${ESTADO_OPENVPN}${N}")"

  echo -ne "$(echo -e "${VERD} [7]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}AJUSTES SSH   ${ESTADO_SSH}${N}")"
  echo -e "$(echo -e "${VERD}[16]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}CHECKUSER ONLINE${ESTADO_CHECKUSER}${N}")"

  echo -ne "$(echo -e "${VERD} [8]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}WS-EPRO       ${ESTADO_WSEPRO}${N}")"
  echo -e "$(echo -e "${VERD}[17]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}ATKEN & HASH  ${ESTADO_TOKEN}${N}")"

  echo -ne "$(echo -e "${VERD} [9]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}PSIPHON       ${ESTADO_PSIPHON}${N}")"
  echo -e "$(echo -e "${VERD}[18]${N}")$(echo -e "${VERM}>${N}") $(echo -e "${AZU}FILEBROWSER   ${ESTADO_FILEBROWSER}${N}")"

  echo -e "\e[36m══════════════════════════════════════════════════════════════\e[0m"
  echo -ne "$(echo -e "${VERD} [0]${N}")$(echo -e "${VERM}>${N}") $(echo -e "\e[1;41m   VOLVER   \e[0m")"
  echo -e ""
  echo -e "\e[36m══════════════════════════════════════════════════════════════\e[0m"
  echo -ne " ${AZU}Ingresá una opción: ${N}"

  read op
  case $op in
    0) echo -e "\n${VERD}Volviendo... ✅${N}"; exit 0 ;;
    *) echo -e "\n${VERM}❌ Opción en desarrollo${N}"; sleep 1.5 ;;
  esac
done
FIN

chmod +x /etc/FENIX-SCR/modulos/m2protocolos.sh
echo -e "      ${VERD}✓ Módulo instalado — IGUAL AL ORIGINAL${N}"
