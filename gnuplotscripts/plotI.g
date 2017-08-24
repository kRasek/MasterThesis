reset
#set terminal qt 0 size 1920,450
#plot "DataInv/Invariants.dat" u 1:2 t "<z>" 
#set terminal qt 1 size 1920,450
#plot "DataInv/deltaE.dat" u 1:2 t "{/Symbol D} E"
infile =  "FinalData/levelstatistics/integrable_1/"
_2j = "1 2 3 4 5 6 7 8 9 10 20 40 60 80 100 200"
_j = "1/2 1 3/2 2 5/2 3 7/2 4 9/2 5 10 20 30 40 50 100"
set terminal qt 1 size 1200,800
set multiplot layout 4,4
unset key
do for[i=1:words(_2j)]{
stats infile.'deltaE'.word(_2j,i).'.dat' u 2 nooutput
set title "$j = ".word(_j,i)."$"
noOfBins = 24.0;
maxX = STATS_max
binwidth=maxX/noOfBins;
set boxwidth binwidth
set xrange[0:maxX + binwidth]

bin(x)=binwidth*floor(x/binwidth) +  binwidth/2.0;

f(x) = word(_2j,i)/b*(1-x/b)**(word(_2j,i)-1);
set table 'hist.temp'
plot infile.'deltaE'.word(_2j,i).'.dat' using (bin($2)):(1.0/binwidth/STATS_records) smooth freq
unset table

fit f(x) 'hist.temp' using ($1):($2 == 0 || strcol(3) eq "u" ? 1/0 : $2) via b;
plot f(x), infile.'deltaE'.word(_2j,i).'.dat' using (bin($2)):(1.0/binwidth/STATS_records) smooth freq with boxes t '2j='.word(_2j,i)
system('rm hist.temp')
}
unset multiplot
reset