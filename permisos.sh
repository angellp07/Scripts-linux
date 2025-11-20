#! /bin/bash

clear


echo "---------------------------------------------------------------------------"
echo "Hola bienvenido"
echo "---------------------------------------------------------------------------"

echo "0) Salir"
echo "1) Mostrar permisos"
echo "2) Cambiar permisos en octal"
echo "3) Cambiar permisos con ugo y +-"
echo "4) Cambiar permisos con ugo y ="
echo "5) Mostrar umask"

echo "---------------------------------------------------------------------------"
read -p "¿Que opcion eliges:? " opcion
echo "---------------------------------------------------------------------------"


case $opcion in

0)
	echo "adios"
	;;

1)
if [ "$ruta" != */ ]
then
    ruta="$ruta/"
fi

read -p "¿Ruta: " ruta
read -p "¿nombre del directorio/archivo: " informacion
echo "___________________________________________________________________________"

if [ -e "$ruta$informacion" ]
then
        ls -l "$ruta$informacion" | cut -d" " -f1

else
        echo "No existe el archivo/directorio"
fi
        ;;

2)
if [ "$ruta" != */ ]
then
    ruta="$ruta/"
fi

read -p "Ruta: " ruta2
read -p "¿Nombre del archivo/directorio?: " informacion2
read -p "Dime los permisos en octal: " octal
echo "___________________________________________________________________________"

if [ "$octal" -gt 777 ]
then
        echo "No hay permisos mayor a 777"

elif [ -e "$ruta2$informacion2" ]
then
        chmod "$octal" "$informacion2"
	echo "Operacion realizada con exito"
else
        echo "No existe el archivo/directorio"
fi
        ;;
3)
if [ "$ruta" != */ ]
then
    ruta="$ruta/"
fi

read -p "Ruta: " ruta3
read -p "¿Nombre del archivo/directorio?: " informacion3
read -p "Dime a quien se los quieres cambiar [u,g,o]: " usuario
read -p "Dime el valor y los permisos en el siguiente formato [+,-]+[r,w,x]: " permisos
echo "___________________________________________________________________________"

if [ -e "$ruta3$informacion3" ]
then
	chmod "$usuario$permisos" "$ruta3$informacion3"
	ls -l "$ruta3$informacion3"
	echo "Operacion realizada con exito"
else
	echo "No existe el archivo/directorio"
fi
	;;

4)
if [ "$ruta" != */ ]
then
    ruta="$ruta/"
fi

read -p "Ruta: " ruta4
read -p "¿Nombre del archivo/directorio?: " informacion4
read -p "Dime a quien se los quieres cambiar [u,g,o]: " usuario2
read -p "Dime el valor y los permisos en el siguiente formato [=]+[r,w,x]: " permisos2
echo "___________________________________________________________________________"

if [ -e "$ruta4$informacion4" ]
then
	chmod "$usuario2$permisos2" "$ruta4$informacion4"
	ls -l "$ruta4$informacion4"
	echo "Operacion realizada con exito"
else
	echo "No existe el archivo/directorio"
fi
	;;

5)
if [ "$opcion" -eq 5 ]
then
	umask
	echo "Operacion realizada con exito"
else
	echo "Error al mostrar la umask"
fi
esac
echo "---------------------------------------------------------------------------"
