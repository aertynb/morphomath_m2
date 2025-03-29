#!/bin/bash

# Define the function
ex1q1() {
    heightminima uo.pgm 4 20 e1q1/out.pgm && \
    pgm2GA e1q1/out.pgm 2 e1q1/out.ga && \
    GAwatershed e1q1/out.ga e1q1/outwater.ga && \
    GA2khalimsky e1q1/outwater.ga 0 e1q1/watershed.pgm
}

ex1q2() {
    frame e1q1/watershed.pgm 1 e1q2/mark.pgm &&
    inverse e1q1/watershed.pgm e1q2/watershed.pgm &&
    geodilat e1q2/mark.pgm e1q2/watershed.pgm 4 -1 e1q2/corner.pgm
    sub e1q2/watershed.pgm e1q2/corner.pgm e1q2/result.pgm
}

ex1q3() {
    echo Total white pixels : && \
    area e1q2/result.pgm && \
    echo Nb of cells : && \
    nbcomp e1q2/result.pgm 4 fgd 
    echo Average white pixels per cells : 3609
}

ex2q1() {
    seuil bloodcells.pgm 140 e2q1/seuil.pgm
    inverse e2q1/seuil.pgm e2q1/inv_seuil.pgm
    areaopening e2q1/inv_seuil.pgm 4 4 e2q1/closing.pgm
    areaclosing e2q1/closing.pgm 4 1000 e2q1/out.pgm
}

ex2q2() {
    frame e2q1/out.pgm 1 e2q2/mark.pgm &&
    geodilat e2q2/mark.pgm e2q1/out.pgm 4 -1 e2q2/corner.pgm &&
    sub e2q1/out.pgm e2q2/corner.pgm e2q2/result.pgm
}

ex2q3() {
    inverse e2q2/result.pgm e2q3/inverse1.pgm &&
    dist e2q3/inverse1.pgm 1 e2q3/dpmap.pgm &&
    long2byte e2q3/dpmap.pgm 1 e2q3/dpmap_b.pgm &&
    inverse e2q3/dpmap_b.pgm e2q3/inv_dpmap.pgm &&
    pgm2GA e2q3/inv_dpmap.pgm 2 e2q3/inv_dpmap.ga &&
    GAwatershed e2q3/inv_dpmap.ga e2q3/out.ga &&
    GA2khalimsky e2q3/out.ga 0 e2q3/out.pgm
}

# ex1q1
# ex1q2
# ex1q3
ex2q1
ex2q2
ex2q3