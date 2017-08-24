set print folder."/Fits.dat" 
set terminal png
set yrange[0:1]
set xrange[-2.5:2.5]
set samples 2000

N=1;
mu=0.1;
sigma = 0.14;

do for[i=0:_N-1]{
  mu=mu*1.1+0.01
  infile = sprintf(folder."/groundstate_gamma_%d.dat",i)
  fit f(x) infile using 1:2 via N,mu,sigma;
  gamma = system("sed '".(i+9)."!d' ".folder."/param.dat | awk '{print $1}'")
  
  print gamma." ", mu, mu_err, sigma, sigma_err

  outfile = sprintf(folder."/plots/gamma_%d.png",i)
  set output outfile
  set title "gamma = ".gamma
  plot f(x), infile using 1:2
}
set terminal qt 0
set output