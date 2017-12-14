#!/bin/bash 

LC_NUMERIC="en_US.UTF-8"

iteraciones=1
q="5 10 20" #capacidad
n="80 120 160" 
cantInstancias=5

while getopts 'ha:' opt; do
  case $opt in
    a) iteraciones=$OPTARG ;;
    h) echo ""
       echo "    Experimento 1"
       echo ""
       echo "    Opciones disponibles:"
       echo "        -h        Imprime este texto de ayuda."
       echo "        -a <núm>  Cantidad de iteraciones - por defecto 1"
       echo ""
       exit 0 ;;
  esac
done


printf "%d \n" $iteraciones >> $(dirname $0)/tiempos-exp_comparacion.txt

#==================================== Tests para N=80

for k in $cantInstancias; do
  printf "tc-80 %d " $k >> $(dirname $0)/tiempos-exp1.txt
  echo "Esta corriendo la instancia tc80-"
  printf "%d\n " $k

  for h in $(seq 1 $iteraciones); do
    echo "iteracion numero"
    printf "%d\n " $h
    $(dirname $0)/../../tpMeta < $(dirname $0)/tc80-$k.txt -t >> $(dirname $0)/tiempos-exp_comparacion.txt
  done
  printf "\n" >> $(dirname $0)/tiempos-exp1.txt
done

for k in $cantInstancias; do
  printf "te-80 %d " $k >> $(dirname $0)/tiempos-exp1.txt
  echo "Esta corriendo la instancia tc80-"
  printf "%d\n " $k

  for h in $(seq 1 $iteraciones); do
    echo "iteracion numero"
    printf "%d\n " $h
    $(dirname $0)/../../tpMeta < $(dirname $0)/te80-$k.txt -t >> $(dirname $0)/tiempos-exp_comparacion.txt
  done
  printf "\n" >> $(dirname $0)/tiempos-exp1.txt
done

#==================================== Tests para N=120
  printf "tc-120-1 " >> $(dirname $0)/tiempos-exp1.txt
  echo "Esta corriendo la instancia tc120-1"
  for h in $(seq 1 $iteraciones); do
    echo "iteracion numero"
    printf "%d\n " $h
    $(dirname $0)/../../tpMeta < $(dirname $0)/tc120-1.txt -t >> $(dirname $0)/tiempos-exp_comparacion.txt
  done
  printf "\n" >> $(dirname $0)/tiempos-exp1.txt

  printf "te-120-1 " >> $(dirname $0)/tiempos-exp1.txt
 echo "Esta corriendo la instancia te120-1"
  for h in $(seq 1 $iteraciones); do
    echo "iteracion numero"
    printf "%d\n " $h
    $(dirname $0)/../../tpMeta < $(dirname $0)/te120-1.txt -t >> $(dirname $0)/tiempos-exp_comparacion.txt
  done
  printf "\n" >> $(dirname $0)/tiempos-exp1.txt  

#==================================== Tests para N=160
 printf "tc-160-1 " >> $(dirname $0)/tiempos-exp1.txt
 echo "Esta corriendo la instancia tc160-1"
  for h in $(seq 1 $iteraciones); do
    echo "iteracion numero"
    printf "%d\n " $h
    $(dirname $0)/../../tpMeta < $(dirname $0)/tc160-1.txt >> $(dirname $0)/tiempos-exp_comparacion.txt
  done
  printf "\n" >> $(dirname $0)/tiempos-exp1.txt

 printf "te-160-1 " >> $(dirname $0)/tiempos-exp1.txt
 echo "Esta corriendo la instancia te160-1"
  for h in $(seq 1 $iteraciones); do
    echo "iteracion numero"
    printf "%d\n " $h
    $(dirname $0)/../../tpMeta < $(dirname $0)/te160-1.txt >> $(dirname $0)/tiempos-exp_comparacion.txt
  done
  printf "\n" >> $(dirname $0)/tiempos-exp1.txt  

#octave -q $(dirname $0)/exp1.m