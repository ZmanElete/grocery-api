# BACKUP DATABASE USING
  - docker-compose exec db /usr/bin/mysqldump -u grocery_user --password=grocery_password grocery_DB > backup.sql
