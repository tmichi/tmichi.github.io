X=$(echo $3 | sed -e 's@[^/]@@g')
pandoc  -F pandoc-crossref --css ${X////../}$1 --template $2 --to html5 -o $4 $3
