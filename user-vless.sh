#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : NevermoreSSH
# (C) Copyright 2022
# =========================================
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
clear
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP=$(curl -s ipinfo.io/ip )
MYIP=$(curl -sS ipv4.icanhazip.com)
MYIP=$(curl -sS ifconfig.me )
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\\E[0;47;30m    Check XRAY Vless WS Config     \E[0m"
                echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                echo "You have no existing clients!"
                clear
                exit 1
        fi

        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo -e "\\E[0;47;30m    Check XRAY Vless WS Config     \E[0m"
        echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  Expired   User"
        grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
clear
echo ""
read -p "Bug Address (Example: www.google.com) : " address
read -p "Bug SNI/Host (Example : m.facebook.com) : " hst
bug_addr=${address}.
bug_addr2=${address}
if [[ $address == "" ]]; then
sts=$bug_addr2
else
sts=$bug_addr
fi
bug=${hst}
bug2=${domain}
if [[ $hst == "" ]]; then
sni=$bug2
else
sni=$bug
fi
user=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /root/domain)
uuid=$(grep "},{" /usr/local/etc/xray/vless.json | cut -b 11-46 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/usr/local/etc/xray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`

umof="vless://${uuid}@${domain}:80?type=ws&encryption=none&security=none&host=www.pubgmobile.com&path=/vless#umoFunz_${user}_${exp}"
digi2="vless://${uuid}@162.159.134.61:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless#DIGIBOOSTER2_${user}_${exp}"
digi3="vless://${uuid}@ufuture.uitm.edu.my:80?type=ws&encryption=none&security=none&host=${domain}&path=/vless#yes4g/digiapn_${user}_${exp}"
yes3="vless://${uuid}@104.17.113.188:80?type=ws&encryption=none&security=none&host=cdn.who.int.${domain}&path=/vless#yesEXP_${user}_${exp}"
yes4="vless://${uuid}@${MYIP}:80?type=ws&encryption=none&security=none&host=cd.who.int&path=/vless#yesNOCF_${user}_${exp}"
pubg="vless://${uuid}@${domain}:80?type=ws&encryption=none&security=none&host=www.pubgmobile.com&path=/vless#yoodoPUBG_${user}_${exp}"
mlbb="vless://${uuid}@${domain}:80?type=ws&encryption=none&security=none&host=www.mobilelegends.com&path=/vless#yoodoMLBB_${user}_${exp}"
booster1="vless://${uuid}@${sts}104.18.203.232:$none?type=ws&encryption=none&security=none&host=www.speedtest.net.${domain}&path=/vless#yoodoBOOSTER2_${user}_${exp}"
booster2="vless://${uuid}@${sts}104.18.203.232:$none?type=ws&encryption=none&security=none&host=www.speedtest.net.${domain}&path=/vless#celcomBOOSTER2_${user}_${exp}"
booster3="vless://${uuid}@${sts}104.18.203.232:$none?type=ws&encryption=none&security=none&host=www.speedtest.net.${domain}&path=/vless#tunetalkBOOSTER2_${user}_${exp}"
pokemon="vless://${uuid}@${domain}:443?type=ws&encryption=none&security=tls&host=www.pokemon.com&path=/vless&allowInsecure=1&sni=www.pokemon.com#digiPOKEMON_${user}_${exp}"
uni1="vless://${uuid}@cdn.who.int:443?type=ws&encryption=none&security=tls&host=${domain}&path=/vless&allowInsecure=1&sni=${domain}#UnifiNoSub_${user}_${exp}"
maxis1="vless://${uuid}@zn4oa6cok9jkhgn6c-maxiscx.siteintercept.qualtrics.com:80?type=ws&encryption=none&security=none&host=zn4oa6cok9jkhgn6c-maxiscx.siteintercept.qualtrics.com.${domain}&path=/vless#maxisnosub_${user}_${exp}"

clear
echo -e ""
echo -e "════[XRAY VLESS WS]═════"
echo -e "Remarks           : ${user}"
echo -e "Domain            : ${domain}"
echo -e "IP/Host           : ${MYIP}"
echo -e "Port TLS          : 443"
echo -e "Port None TLS     : 80, 8080, 8880"
echo -e "ID                : ${uuid}"
echo -e "Security          : TLS"
echo -e "Encryption        : None"
echo -e "Network           : WS"
echo -e "Path              : /vless"
echo -e "Multipath         : /yourpath"
echo -e "═══════════════════"
echo -e "Link WS TLS       : ${vlesslink1}"
echo -e "═══════════════════"
echo -e "Link WS None TLS  : ${vlesslink2}"
echo -e "═══════════════════"
echo -e "Link UMO FUNZ     : ${umof}"
echo -e "═══════════════════"
echo -e "Link DIGIBOOSTER  : ${digi2}"
echo -e "═══════════════════"
echo -e "Link DIGIAPN      : ${digi3}"
echo -e "═══════════════════"
echo -e "Link YES EXP      : ${yes3}"
echo -e "═══════════════════"
echo -e "Link YES NOCF     : ${yes4}"
echo -e "═══════════════════"
echo -e "Link yoodoPUBG    : ${pubg}"
echo -e "═══════════════════"
echo -e "Link yoodoMLBB    : ${mlbb}"
echo -e "═══════════════════"
echo -e "Link yoodoBOOSTER : ${booster1}"
echo -e "═══════════════════"
echo -e "Link celcomBOOSTER/0basic : ${booster2}"
echo -e "═══════════════════"
echo -e "Link tunetalkBOOSTER : ${booster3}"
echo -e "═══════════════════"
echo -e "Link digiPOKEMON      : ${pokemon}"
echo -e "═══════════════════"
echo -e "Link MaxisNoSub   : ${maxis1}"
echo -e "═══════════════════"
echo -e "Link UnifiNoSub   : ${uni1}"
echo -e "═══════════════════"
echo -e "YAML WS TLS       : http://${MYIP2}:81/$user-VLESSTLS.yaml"
echo -e "═══════════════════"
echo -e "YAML WS None TLS  : http://${MYIP2}:81/$user-VLESSNTLS.yaml"
echo -e "═══════════════════"
echo -e "Created On        : $hariini"
echo -e "Expired On        : $exp"
echo -e "═══════════════════"
echo -e ""
echo -e "Script Mod By NevermoreSSH"
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
menu
