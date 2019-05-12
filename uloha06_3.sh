cut -d':' -f4 /etc/group | awk '{FS = ","; print NF}'>tmp1
paste tmp1 /etc/group |sort > tmp2
tail -1 tmp2|cut -f1>tmp3
join tmp2 tmp3|cut -d' ' -f2|cut -d: -f1
