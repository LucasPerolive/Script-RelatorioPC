#!/bin/bash

read -p "Nome do Usuario: " USUARIO

ls /home/$USUARIO > /dev/null 2>&1 || { echo "Usuario Inexistente" ; exit 1;}

USERID=$(grep $USUARIO /etc/passwd|cut -d":" -f3)
DESC=$(grep $USUARIO /etc/passwd|cut -d":" -f5 | tr -d ,)
USOHOME=$(du -sh /home/$USUARIO|cut -f1)

clear
echo "======================================================================="
echo "Relatorio do Usuario: $USUARIO"
echo
echo "UID: $USERID"
echo "Nome ou Descricao: $DESC"
echo
echo "Total Usado no /home/$1: $USOHOME"
echo
echo "Ultimo Login:"
lastlog -u $USUARIO
echo "======================================================================="
exit 0
