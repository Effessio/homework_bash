#!/bin/sh


cat << __EOF | gnuplot
 plot 'ex.dat' u 1:2 w linesp, 'ex.dat' u 1:3 w linesp
pause 1000
__EOF