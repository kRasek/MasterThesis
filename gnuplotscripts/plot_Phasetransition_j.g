reset
folder = "FinalData/filesPT/sigma_delta_pi4_alpha0"
set fit quiet

set terminal png
N=12
set samples 2000
sigma0 = exp(0.7825);
set print folder."/plots/Fits.dat" 
f(x)=N*exp(-(x-mu)**2/sigma**2) + N*exp(-(x+mu)**2/sigma**2)
do for[i=0:N-1]{
  infile = sprintf(folder."/groundstate_j%d.dat",i)
  sigma = sigma0*(2**(-0.506*i))
  outfile = sprintf(folder."/j%d.png",i)
  set output outfile
  plot infile using 1:2 t "groundstate" w l
  fit f(x) infile using ($1):($2):(1/($2)) yerr via N,mu,sigma
  set output outfile
  plot f(x), infile using 1:2 t "groundstate" w l

  print 2**i, mu, mu_err, sigma, sigma_err
}
reset
set key t c
unset key
set terminal epslatex color size 8cm,6cm
set output "figures/tex/sigma_j.tex"
set logscale xy
set xlabel "$j$"
set ylabel "$\\sigma$"
f(x) = a*x+b
fit f(x) folder."/plots/Fits.dat" using (log(0.5*$1)):(log($4)) via a,b
g(x) = exp(b)* x**a
set xrange[0.25:2000]
set ytics
plot g(x),folder."/plots/Fits.dat" using (0.5*$1):4
set terminal qt 0 
set output