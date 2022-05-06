#!/bin/bash

# desarrollado por manuellara.mvz@gmail.com
#Para ejercicio de Biofreelancer.com

#Este script pregunta a datos covid para un país

#Para trabajar bash desde la consola hay que poner

# bash pregunton.sh

# 1. cual ha sido el día con más casos nuevos

#Primer paso, elegir país

pais_de_interes=$1

#al colocar el simbolo $1 podemos automatizar la respuesta



#Enviar mensaje de inicio
echo "Analizando datos de $pais_de_interes..."
echo ".........................."


#anunciamos la respuesta
# cat es concatenar, imprime en la pantalla lo que esta en la hoja
echo "Para $pais_de_interes la información es la siguiente:
................................"


#Se borro la información de la creación de los archivo

#lo hacemos pipeline
grep $pais_de_interes owid-covid-data.tsv \
| cut -f3,4,6 \
| sort -k3 -n \
| tail -n1 > dia_mas_casos.tmp



#reporte del análisis

echo "El día con más casos fue:"
cut -f2 dia_mas_casos.tmp
echo ".........................."

echo "con un total de pacientes reportados de:"
cut -f3 dia_mas_casos.tmp
echo ".........................."

echo "fin del comunicado"

#borrar archivos intermedios

rm *.tmp

#con este modo todos los archivos .tmp se borran de la carpeta despues de realizar el análisis












