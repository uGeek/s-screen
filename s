#!/bin/bash

VERSION="v0.1  - 26/10/2020"



if [ "$1" = "h" ] ||  [ "$1" = "help" ] ||  [ "$1" = "-help" ] ||  [ "$1" = "-h" ]  
then
echo "
screen
Modo de empleo: s [OPCIONES]

 s           ->  Crear nueva sesión
 s        c  ->  Crear una nueva sesión con nombre de sesión
 s       ls  ->  Listar todas las sesiones
 s        i  ->  Entrar a una sesión
 s        k  ->  Matar una sesión  
 s        n  ->  Dar nombre a una sesión
 s        h  ->  Ayuda
 
s $VERSION
Copyright (C) 2020 Angel. uGeek
ugeekpodcast@gmail.com
"
exit
fi


if [ "$1" = "c" ]
then
echo -en "Nombre de sesión: "
read NOMBRE
screen -S  $NOMBRE 
exit
fi


if [ "$1" = "i" ]
then
echo "screens corriendo:"
screen -ls | tail -n +2 |   head -n -1 | cut -d ")" -f1 | sed s'|(|\t|'g |nl 
echo ""
echo -en "Indica el número: "
read NUMERO
SCREEN=$(screen -ls | tail -n +2 | head -n -1 | cut -d. -f1 | cut -d " " -f2 | sed -n "$NUMERO"p)
screen -r $SCREEN
exit
fi


if [ "$1" = "k" ]
then
echo ""
screen -ls | tail -n +2 | head -n -1 | cut -d ")" -f1 | sed s'|(|\t|'g |nl 
echo ""
echo -en "Indica el número: "
read NUMERO
SCREEN=$(screen -ls | tail -n +2 | head -n -1 | cut -d. -f1 | cut -d " " -f2 | sed -n "$NUMERO"p)
screen -XS $SCREEN quit
exit
fi


if [ "$1" = "n" ]
then
echo ""
screen -ls | tail -n +2 | head -n -1 | cut -d ")" -f1 | sed s'|(|\t|'g |nl 
echo ""
echo -en "Indica el número: "
read NUMERO
SCREEN=$(screen -ls | tail -n +2 | head -n -1 | cut -d. -f1 | cut -d " " -f2 | sed -n "$NUMERO"p)
echo -en "Da un nombre a la sesión: "
read NOMBRE
screen -S $SCREEN -X sessionname $NOMBRE
exit
fi


if [ "$1" = "ls" ]
then
echo ""
echo "screens corriendo:"
screen -ls | tail -n +2 | head -n -1 | cut -d ")" -f1 | sed s'|(|\t|'g 
echo ""
exit
fi

screen
