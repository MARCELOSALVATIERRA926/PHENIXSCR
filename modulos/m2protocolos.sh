cat > /etc/FENIX-SCR/modulos/m2protocolos.sh << 'FIN_ARCHIVO'
#!/bin/bash
# ==============================================
#    MÓDULO 2 — ADMINISTRADOR DE PROTOCOLOS
#             Fenix 3815569765
# ==============================================

# === COLORES ===
N="\033[0m"
B="\033[1;37m"
A="\033[1;33m"
V="\033[1;32m"
R="\033[1;31m"
C="\033[1;36m"
Az="\033[1;34m"
M="\033[1;35m"

# === ESTADO INICIAL ===
ESTADO_SSH=true
ESTADO_DROPBEAR=true
ESTADO_SOCKS=true
ESTADO_STUNNEL=false
ESTADO_SLOWDNS=false
ESTADO_WSEPRO=false
ESTADO_UDPCUSTOM=false
ESTADO_UDPHYSTERIA=false
ESTADO_BADVPN=false
ESTADO_SQUID=false
ESTADO_OPENVPN=false
ESTADO_CHECKUSER=false
ESTADO_ATKEN=false
ESTADO_FILEBROWSER=false
ESTADO_V2RAY=false
ESTADO_SSHGO=false
ESTADO_WIREGUARD=false
ESTADO_HCRM=false

estado() {
  [ "$1" = true ] && echo -e "${V}[ON]${N}" || echo -e "${R}[OFF]${N}"
}

while true; do
  clear
  echo -e "
${C}══════════════════════════════════════════════════════════════${N}
${M}                        Fenix 3815569765${N}
${C}══════════════════════════════════════════════════════════════${N}
${B}                  ADMINISTRADOR DE PROTOCOLOS${N}
${C}══════════════════════════════════════════════════════════════${N}
  ${V}DROPBEAR:${N} 90                  ${V}PYTHON3:${N} 80
  ${V}SSH:${N}   22
${C}══════════════════════════════════════════════════════════════${N}
  ${A}[01]${N}  AJUSTES SSH        $(estado $ESTADO_SSH)   ${A}[10]${N}  SQUID               $(estado $ESTADO_SQUID)
  ${A}[02]${N}  DROPBEAR           $(estado $ESTADO_DROPBEAR) ${A}[11]${N}  OPENVPN             $(estado $ESTADO_OPENVPN)
  ${A}[03]${N}  SOCKS PYTHON       $(estado $ESTADO_SOCKS)    ${A}[12]${N}  CHECKUSER ONLINE    $(estado $ESTADO_CHECKUSER)
  ${A}[04]${N}  STUNNEL (SSL)      $(estado $ESTADO_STUNNEL)  ${A}[13]${N}  ATKEN and HASH      $(estado $ESTADO_ATKEN)
  ${A}[05]${N}  SLOWDNS            $(estado $ESTADO_SLOWDNS)  ${A}[14]${N}  FILEBROWSER         $(estado $ESTADO_FILEBROWSER)
  ${A}[06]${N}  WS-EPRO            $(estado $ESTADO_WSEPRO)   ${A}[15]${N}  V2RAY/XRAY          $(estado $ESTADO_V2RAY)
  ${A}[07]${N}  UDP-CUSTOM         $(estado $ESTADO_UDPCUSTOM) ${A}[16]${N}  SSHGO               $(estado $ESTADO_SSHGO)
  ${A}[08]${N}  UDP-HYSTERIA       $(estado $ESTADO_UDPHYSTERIA) ${A}[17]${N}  WIREGUARD           $(estado $ESTADO_WIREGUARD)
  ${A}[09]${N}  BADVPN-UDPGW       $(estado $ESTADO_BADVPN)   ${A}[18]${N}  HCRM                $(estado $ESTADO_HCRM)
${C}══════════════════════════════════════════════════════════════${N}
  ${V}[00]${N}  Volver al menú principal
${C}══════════════════════════════════════════════════════════════${N}
 ${B}Ingresá una opción: ${N}\c"

  read op
  case "$op" in
    0|00) echo -e "\n${V}Volviendo... ✅${N}"; exit 0 ;;
    1|01) echo -e "\n${A}[01] AJUSTES SSH → En desarrollo...${N}"; sleep 1.5 ;;
    2|02) echo -e "\n${A}[02] DROPBEAR → En desarrollo...${N}"; sleep 1.5 ;;
    3|03) echo -e "\n${A}[03] SOCKS PYTHON → En desarrollo...${N}"; sleep 1.5 ;;
    4|04) echo -e "\n${A}[04] STUNNEL → En desarrollo...${N}"; sleep 1.5 ;;
    5|05) echo -e "\n${A}[05] SLOWDNS → En desarrollo...${N}"; sleep 1.5 ;;
    6|06) echo -e "\n${A}[06] WS-EPRO → En desarrollo...${N}"; sleep 1.5 ;;
    7|07) echo -e "\n${A}[07] UDP-CUSTOM → En desarrollo...${N}"; sleep 1.5 ;;
    8|08) echo -e "\n${A}[08] UDP-HYSTERIA → En desarrollo...${N}"; sleep 1.5 ;;
    9|09) echo -e "\n${A}[09] BADVPN-UDPGW → En desarrollo...${N}"; sleep 1.5 ;;
   10) echo -e "\n${A}[10] SQUID → En desarrollo...${N}"; sleep 1.5 ;;
   11) echo -e "\n${A}[11] OPENVPN → En desarrollo...${N}"; sleep 1.5 ;;
   12) echo -e "\n${A}[12] CHECKUSER ONLINE → En desarrollo...${N}"; sleep 1.5 ;;
   13) echo -e "\n${A}[13] ATKEN and HASH → En desarrollo...${N}"; sleep 1.5 ;;
   14) echo -e "\n${A}[14] FILEBROWSER → En desarrollo...${N}"; sleep 1.5 ;;
   15) echo -e "\n${A}[15] V2RAY/XRAY → En desarrollo...${N}"; sleep 1.5 ;;
   16) echo -e "\n${A}[16] SSHGO → En desarrollo...${N}"; sleep 1.5 ;;
   17) echo -e "\n${A}[17] WIREGUARD → En desarrollo...${N}"; sleep 1.5 ;;
   18) echo -e "\n${A}[18] HCRM → En desarrollo...${N}"; sleep 1.5 ;;
    *) echo -e "\n${R}❌ Opción inválida${N}"; sleep 1.2 ;;
  esac
done
FIN_ARCHIVO

chmod +x /etc/FENIX-SCR/modulos/m2protocolos.sh
echo -e "      ${V}✓ Módulo m2protocolos.sh instalado correctamente${N}"
