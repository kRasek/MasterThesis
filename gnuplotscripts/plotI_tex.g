reset
#set terminal qt 0 size 1920,450
#plot "DataInv/Invariants.dat" u 1:2 t "<z>" 
#set terminal qt 1 size 1920,450
#plot "DataInv/deltaE.dat" u 1:2 t "{/Symbol D} E"
infile =  "FinalData/levelstatistics/integrable0.5/"
_2j = "1 2 3 4 5 6 7 8 "
_2j2 = "9 10 20 40 60 80 100 200"
_j = "1/2 1 3/2 2 5/2 3 7/2 4"
_j2 = "9/2 5 10 20 30 40 50 100"


unset key
do for[i=1:words(_2j)]{
  stats infile.'deltaE'.word(_2j,i).'.dat' u 2 nooutput
  noOfBins = 24.0;
  maxX = STATS_max
  binwidth=maxX/noOfBins;
  set boxwidth binwidth
  set xrange[0:maxX + binwidth]

  bin(x)=binwidth*floor(x/binwidth) +  binwidth/2.0;

  set table 'hist'.i.'.temp'
  plot infile.'deltaE'.word(_2j,i).'.dat' using (bin($2)):(1.0/binwidth/STATS_records) smooth freq
  unset table
}

ntics = 4

set terminal epslatex color size 12cm, 16cm
set output 'figures/tex/histograms_I.tex'
set multiplot layout 4,2
do for[i=1:words(_2j)]{
  stats infile.'deltaE'.word(_2j,i).'.dat' u 2 nooutput
  set title "$j = ".word(_j,i)."$"
  noOfBins = 24.0;
  maxX = STATS_max
  set xtics maxX/ntics
  binwidth=maxX/noOfBins;
  set boxwidth binwidth
  set xrange[0:maxX + binwidth]

  bin(x)=binwidth*floor(x/binwidth) +  binwidth/2.0;

  f(x) = word(_2j,i)/b*(1-x/b)**(word(_2j,i)-1);

  fit f(x) 'hist'.i.'.temp' using ($1):($2 == 0 || strcol(3) eq "u" ? 1/0 : $2) via b;
  plot f(x), infile.'deltaE'.word(_2j,i).'.dat' using (bin($2)):(1.0/binwidth/STATS_records) smooth freq with boxes t '2j='.word(_2j,i)
  system('rm hist'.i.'.temp')
}
unset multiplot
set terminal qt 0
set output 
reset