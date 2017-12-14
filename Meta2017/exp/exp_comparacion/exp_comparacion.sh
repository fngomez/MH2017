#!/bin/bash 

LC_NUMERIC="en_US.UTF-8"

q="5 10 20" #capacidad
n="80 120 160" 
cantInstancias=5

#==================================== Tests para N=80

for k in $cantInstancias; do
  printf "tc-80 %d " $k >> $(dirname $0)/soluciones-exp1.txt
  echo "Esta corriendo la instancia tc80-"
  printf "%d\n " $k
  
  $(dirname $0)/../../tpMeta < $(dirname $0)/tc80-$k.txt >> $(dirname $0)/soluciones-exp_comparacion.txt
  printf "\n" >> $(dirname $0)/soluciones-exp1.txt
done

for k in $cantInstancias; do
  printf "te-80 %d " $k >> $(dirname $0)/soluciones-exp1.txt
  echo "Esta corriendo la instancia tc80-"
  printf "%d\n " $k

  $(dirname $0)/../../tpMeta < $(dirname $0)/te80-$k.txt >> $(dirname $0)/soluciones-exp_comparacion.txt
  printf "\n" >> $(dirname $0)/soluciones-exp1.txt
done

#==================================== Tests para N=120
  printf "tc-120-1 " >> $(dirname $0)/soluciones-exp1.txt
  echo "Esta corriendo la instancia tc120-1"
  $(dirname $0)/../../tpMeta < $(dirname $0)/tc120-1.txt >> $(dirname $0)/soluciones-exp_comparacion.txt
  printf "\n" >> $(dirname $0)/soluciones-exp1.txt

  printf "te-120-1 " >> $(dirname $0)/soluciones-exp1.txt
  echo "Esta corriendo la instancia te120-1"
  $(dirname $0)/../../tpMeta < $(dirname $0)/te120-1.txt >> $(dirname $0)/soluciones-exp_comparacion.txt
  printf "\n" >> $(dirname $0)/soluciones-exp1.txt  

#==================================== Tests para N=160
 printf "tc-160-1 " >> $(dirname $0)/soluciones-exp1.txt
 echo "Esta corriendo la instancia tc160-1"
 $(dirname $0)/../../tpMeta < $(dirname $0)/tc160-1.txt >> $(dirname $0)/soluciones-exp_comparacion.txt
 printf "\n" >> $(dirname $0)/soluciones-exp1.txt

 printf "te-160-1 " >> $(dirname $0)/soluciones-exp1.txt
 echo "Esta corriendo la instancia te160-1"
 $(dirname $0)/../../tpMeta < $(dirname $0)/te160-1.txt >> $(dirname $0)/soluciones-exp_comparacion.txt
 printf "\n" >> $(dirname $0)/soluciones-exp1.txt  