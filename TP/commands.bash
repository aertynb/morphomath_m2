#!/bin/bash

# Define the function
ex1q1() {
    heightminima uo.pgm 4 20 ex1/out.pgm && \
    pgm2GA ex1/out.pgm 2 ex1/out.ga && \
    GAwatershed ex1/out.ga ex1/outwater.ga && \
    GA2khalimsky ex1/outwater.ga 0 ex1/watershed.pgm
}

ex1q2() {
    frame ex1/watershed.pgm 1 ex2/mark.pgm &&
    inverse ex1/watershed.pgm ex2/watershed.pgm &&
    geodilat ex2/mark.pgm ex2/watershed.pgm 4 -1 ex2/corner.pgm
    sub ex2/watershed.pgm ex2/corner.pgm ex2/result.pgm
}

ex1q3() {
    label ex2/result.pgm 4 max ex2/labeled.pgm
}

# ex1q1
# ex1q2
ex1q3