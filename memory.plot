### grouped boxplots
# Reset session and set up variables
reset session

FILES     = 'trad_mem made_mem'
File(n)   = sprintf("%s.tsv", word(FILES, n))
myXtic(n) = sprintf("%s", word(FILES, n))

#set title "CPU Consumption Percentage" font "Helvetica-Bold,20"
set xlabel "Apps" font "Helvetica-Bold,45"
set ylabel "Memory Usage(in MB)" font "Helvetica-Bold,45"
set yrange [4:14]
#set xrange [-1:10]
set grid y
set key noautotitle
#set style fill solid 0.7
set style fill pattern 3
set key font "Helvetica-Bold,45"
set style boxplot nooutliers
#set border 1
set key horizontal

set bmargin at screen 0.1
set lmargin at screen 0.07

N    = words(FILES)    # Number of files
COLS = 4               # Number of columns in each file
GroupWidth = 1         # Width of each group of boxplots
Gap = 3                # Gap between each group of columns
PosX = -1               # Initial x-position of boxplot

# Prepare the plot command separately for each column
plot \
     File(1) u (PosX + 0 * Gap):1 w boxplot lc 1, \
     File(2) u (PosX + 0 * Gap + GroupWidth):1 w boxplot lc 1, \
     File(1) u (PosX + 1 * Gap):2 w boxplot lc 2, \
     File(2) u (PosX + 1 * Gap + GroupWidth):2 w boxplot lc 2, \
     File(1) u (PosX + 2 * Gap):3 w boxplot lc 3, \
     File(2) u (PosX + 2 * Gap + GroupWidth):3 w boxplot lc 3, \
     File(1) u (PosX + 3 * Gap):4 w boxplot lc 4, \
     File(2) u (PosX + 3 * Gap + GroupWidth):4 w boxplot lc 4, \
     for [COL=0:COLS] File(1) u (NaN):COL w boxes lc COL ti columnhead, \
#     for [n=1:N] File(1) u ((COLS-1) * Gap + N/2.0):(NaN):xtic(myXtic(n))

### end of code
