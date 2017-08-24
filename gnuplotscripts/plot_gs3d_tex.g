set terminal epslatex color size 12 cm,8 cm
set output 'figures/tex/groundstate.tex'

l 'gnuplotscripts/plot_gs3d.g'

set terminal qt
set output