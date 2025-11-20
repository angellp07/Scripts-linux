#!/bin/bash

#Limpiar terminal

clear
#Bienvenida y opciones
echo "--------------------------------------------------------------------------------------------------"
echo "Bienvenido a la gestion de sistema."
echo "1) Crear directorio."
echo "2) Crear archivo."
echo "3) Mostrar información."
echo "--------------------------------------------------------------------------------------------------"

#Valores de las opciones

read -p "¿Qué deseas hacer?: " opcion

if [ $opcion -eq 1 ]
then
    read -p "¿En qué ruta?: " ruta
    read -p "Nombre del directorio: " direct

elif [ $opcion -eq 2 ]
then
    read -p "¿En qué ruta?: " ruta
    read -p "Nombre del archivo: " archivo

elif [ $opcion -eq 3 ]
then
    read -p "¿En qué ruta?: " ruta
    read -p "Nombre del archivo/directorio: " informacion
fi
echo "--------------------------------------------------------------------------------------------------"

#Comandos que se ejecuntan al selecionar las opciones con sus reptivas opciones

case $opcion in
1)
    mkdir "$ruta$direct" 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Error al crear directorio. Enviando a la papelera..."
    gio trash "$ruta$direct" 2>/dev/null
else
    echo "Directorio creado con éxito."
fi
    ;;

#echo "--------------------------------------------------------------------------------------------------"

2)
    touch "$ruta$archivo" 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Error al crear el archivo. Enviando a la papelera..."
    gio trash "$ruta$archivo" 2>/dev/null
else
    echo "archivo creado con éxito."
fi
    ;;

#echo "--------------------------------------------------------------------------------------------------"

3)
    if [ -d "$ruta$informacion" ]
then
        ls -l "$ruta$informacion"

    elif [ -f "$ruta$informacion" ]
then
        cat "$ruta$informacion"

    else
        echo "No existe archivo o directorio con ese nombre."
    fi
    ;;
*)
    echo "Opción incorrecta."
    ;;
esac
echo "--------------------------------------------------------------------------------------------------"
