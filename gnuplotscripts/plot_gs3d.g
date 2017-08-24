reset
set hidden3d
unset key
set pm3d at b
set zrange [1e-20:1]
set log z
unset colorbox
set logscale cb
set xlabel '$q$'
set ylabel '$p$'
set format z '$10^{%T}$'
set multiplot layout 2,3
set title "$\\delta = 0, \\alpha = 0$"
splot 'FinalData/files_gs/groundstatepi0.dat' with lines 
set title "$\\delta = \\\pi /4, \\alpha = 0$"
splot 'FinalData/files_gs/groundstatepi14.dat' with lines 
set title "$\\delta = \\pi /2, \\alpha = 0$"
splot 'FinalData/files_gs/groundstatepi12.dat' with lines
set title "$\\delta = 3\\pi /4, \\alpha = 0$"
splot 'FinalData/files_gs/groundstatepi34.dat' with lines
set title "$\\delta = \\pi /4, \\alpha = \\pi /100$"
splot 'FinalData/files_gs/groundstatepi14pi1100.dat' with lines
set title "$\\delta = \\pi /4, \\alpha = -\\pi /100$"
splot 'FinalData/files_gs/groundstatepi14pi-1100.dat' with lines
unset multiplot