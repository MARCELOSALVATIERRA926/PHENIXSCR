#!/bin/bash
# ==============================================
#   FENIX-SCR — ENTRADA PRINCIPAL
#       Fenix 3815569765
# ==============================================

clear
echo -e "
════════════════════════════════════════════════════════
        FENIX-SCR — INICIANDO
        Fenix 3815569765
════════════════════════════════════════════════════════
"

wget -q -O /tmp/fenix-instalador "https://raw.githubusercontent.com/MARCELOSALVATIERRA926/PHENIXSCR/main/fenix-instalador"
chmod +x /tmp/fenix-instalador
exec /tmp/fenix-instalador

