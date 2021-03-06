reset
unset key
set fit quiet


f(x)=N*exp(-(x-mu)**2/sigma**2) + N*exp(-(x+mu)**2/sigma**2)

masterFolder = "FinalData/filesPT"
_N=48;
folder001 = masterFolder."/gamma_delta_pi4_alpha0001"
folder100 = masterFolder."/gamma_delta_pi4_alpha0100"
folder200 = masterFolder."/gamma_delta_pi4_alpha0200"
folder400 = masterFolder."/gamma_delta_pi4_alpha0400_"


#folder = folder001
#l "gnuplotscripts/subroutines/pt_fit.g"
#folder = folder100
#l "gnuplotscripts/subroutines/pt_fit.g"
#folder = folder200
#l "gnuplotscripts/subroutines/pt_fit.g"
folder = folder400
l "gnuplotscripts/subroutines/pt_fit.g"

unset yrange
unset xrange

set terminal qt 0
set key t l 
plot folder001."/Fits.dat" using 1:2 w l t "$j = 1/2$", folder100."/Fits.dat" using 1:2 w l t "$j = 50$", folder200."/Fits.dat" using 1:2 w l t "$j = 100$", folder400."/Fits.dat" using 1:2 w l t "$j = 200$" 
