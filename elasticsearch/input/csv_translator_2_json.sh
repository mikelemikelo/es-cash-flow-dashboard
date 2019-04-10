#/bin/bash!

source_file=$1
output_filename=$2

cat $1 | awk -F "," '{print "{ \"index\": { \"_id\":\""$1"_"$5"\"}}\n{ \"business_name\":\""$1"\",\"month_short_name\":\""$2"\",\"day_of_month\":"$3",\"week_day_name\":\""$4"\",\"status_date\":\""$5"\",\"total_pos\":"$6",\"total_cash\":"$7",\"total_cards\":"$8",\"total_expenses\":"$9",\"total_external_expenses\":"$10"}" }' | sed 's/:,/:0.0,/g' | sed 's/:}/:0.0}/g' > ./$2

