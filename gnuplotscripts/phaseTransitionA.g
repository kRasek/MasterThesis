reset
unset key
set fit quiet


f(x)=N*exp(-(x-mu)**2/sigma**2) + N*exp(-(x+mu)**2/sigma**2)

masterFolder = "FinalData/filesPT"
_N=82;
folder000 = masterFolder."/gamma_delta_pi4_alpha0200"
folder001 = masterFolder."/gamma_delta_pi4_alpha0.001200"
folder010 = masterFolder."/gamma_delta_pi4_alpha0.01200"
folder100 = masterFolder."/gamma_delta_pi4_alpha0.1200"
folder500 = masterFolder."/gamma_delta_pi4_alpha0.5200"


folder = folder000
l "gnuplotscripts/subroutines/pt_fit.g"

f(x)=N*exp(-(x-mu)**2/sigma**2)
folder = folder001
l "gnuplotscripts/subroutines/pt_fit.g"
folder = folder010
l "gnuplotscripts/subroutines/pt_fit.g"
folder = folder100
l "gnuplotscripts/subroutines/pt_fit.g"
folder = folder500
l "gnuplotscripts/subroutines/pt_fit.g"

unset yrange
unset xrange

set terminal epslatex color size 12 cm, 8 cm 
unset title
set xlabel "$\\mu$"
set ylabel "$\\gamma$"
set output "figures/tex/phasetransition_alpha.tex"
set key t l 
plot folder000."/Fits.dat" using 1:2 w l t "$\\alpha = 0$", folder001."/Fits.dat" using 1:2 w l t "$\\alpha = 0.001\\pi$", folder010."/Fits.dat" using 1:2 w l t "$\\alpha = 0.01 \\pi$", folder100."/Fits.dat" using 1:2 w l t "$\\alpha = 0.1 \\pi$" , folder500."/Fits.dat" using 1:2 w l t "$\\alpha = 0.5 \\pi$"
set terminal qt 0
set output