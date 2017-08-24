reset

nu = 0.8;
lambda(gamma,delta) = gamma**2 / 4 *(sin(delta)+cos(delta))**2# *(sin(2*delta)>0) +(sin(delta)+cos(delta))**2 *(sin(2*delta)<0) +1*(sin(2*delta)=0))
Q(gamma,delta) = gamma/sqrt(2*nu)* sqrt(1-1/(4*(lambda(gamma,delta))**2))* (sin(delta)+cos(delta))*(sin(2*delta)>0)*(gamma>sqrt(2)/abs(sin(delta)+cos(delta))) + 0*(gamma<sqrt(2)/abs(sin(delta)+cos(delta)))+ 0*(gamma<sqrt(2)/abs(sin(delta)-cos(delta)));
E(gamma,delta) = (-lambda(gamma,delta)-1/(4*lambda(gamma,delta)))*((gamma>sqrt(2)/abs(sin(delta)+ cos(delta)))||(gamma>sqrt(2)/abs(sin(delta) - cos(delta)))) -1*((gamma<=sqrt(2)/abs(sin(delta)+ cos(delta)))&&(gamma<=sqrt(2)/abs(sin(delta) - cos(delta))))

#set xrange[0.6:1.2]
#set yrange[-1.05:-0.99]
set samples 2000
#set terminal cairolatex pdf size 7cm,6cm
#set output "figures/pictures/tex/e_j.tex"
set key b l
set xlabel "$\\gamma$"
set ylabel "ground state energy"
set grid
infileE1 = "FinalData/gamma_delta_pi4_alpha0400/gs_energies_gamma.dat"
infileE2 = "FinalData/gamma_delta_pi4_alpha0200/gs_energies_gamma.dat"
infileE3 = "FinalData/gamma_delta_pi4_alpha0100/gs_energies_gamma.dat"
infileE4 = "FinalData/gamma_delta_pi4_alpha0001/gs_energies_gamma.dat"

f(x,y) = y
linew = 2
#plot Q(x,pi/4) t "classical" lw linew, infile using 1:2 w l t "$j=200$" lw linew,  "DataPhaseTransition/data_vortrag/Fits50.dat" using 1:2 w l t "$j=50$"lw linew, "DataPhaseTransition/data_vortrag/Fits100.dat" using 1:2 w l t "$j=100$"lw linew;
plot E(x,pi/4) t "classical" lw linew , infile1 using 1:(f($1,$2)) w l t "$j=200$" lw linew, infile2 using 1:(f($1,$2)) w l t "$j=100$" lw linew, infile3 using 1:(f($1,$2)) w l t "$j=50$" lw linew, infile4 using 1:(f($1,$2)) w l t "$j=1/2$" lw linew

set output
set terminal qt