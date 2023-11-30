cd /root/rAthena/sql-files/

for sql_file in *.sql; do
    mysql -u ragnarok -p ragnarok < "$sql_file"
done