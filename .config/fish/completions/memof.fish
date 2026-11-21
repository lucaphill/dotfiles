complete -c memof -f -a '(ps -eo rss=,comm= | sort -rn | awk "\$1>10000{print \$2}" | sort -u)'
