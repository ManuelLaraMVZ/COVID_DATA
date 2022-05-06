#!/bin/bash

# desarrollado por manuellara.mvz@gmail.com
#Para ejercicio de Biofreelancer.com

#Este script pregunta a datos covid para un país

#Para trabajar bash desde la consola hay que poner

# bash pregunton.sh

# 1. cual ha sido el día con más casos nuevos

#Primer paso, elegir país

pais_de_interes="France"

#Enviar mensaje de inicio
echo "Analizando datos de $pais_de_interes"
echo "....................................."

#el símbolo de pesos antes del nombre de la variable, lo llama

#EN la consola poner "bash pregunton.sh"

#filtrar datos del país de interés

grep $pais_de_interes owid-covid-data.tsv>pais.tmp

#se acaba de abrir el archivo "pais.tmp" en la misma carpeta

#poner en consola "head pais.tmp"

#extraer solo columnas de interés
cut --fields=3,4,6 pais.tmp > columnas.tmp

#el simbolo de > le dice que mete lo que cortaste del archivo a un nuevo archivo

#ordenar los datos por la tercera columna

sort -k3 -n columnas.tmp>ordenado.tmp

#estraemos la ultima fila del ordenado

tail -n1 ordenado.tmp>dia_mas_casos.tmp

#anunciamos la respuesta
# cat es concatenar, imprime en la pantalla lo que esta en la hoja
echo "Para $pais_de_interes la información es la siguiente:"
echo "................................"

echo "El día con más casos fue:"
cut -f2 dia_mas_casos.tmp
echo "............................"

echo "con los siguientes nuevos casos:"
cut -f3 dia_mas_casos.tmp
echo "............................."

echo "fin del comunicado"
echo "............................"

#borrar archivos intermedios

rm *.tmp

#con este modo todos los archivos .tmp se borran de la carpeta despues de realizar el análisis












