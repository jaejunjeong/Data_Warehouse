## This will use DB2
## You have to use your own DB info (db, port, host, id, password)


# Add the database, host, port and the security mode details. A sample commmand is given for your reference below:
db2cli writecfg add -database yourDB -host yourHost -port yourPort -parameter "SecurityTransportMode=SSL"

# Give a name to the data source we just created
db2cli writecfg add -dsn production -database yourDB -host yourHost -port yourPort

# Validate production dsn(data source)
db2cli validate -dsn production -connect -user yourId -passwd yourPassowrd

#Run the command below to download the schema file.
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/star-schema.sql

#Run the command below to create the schema on the production data warehouse
db2cli execsql -dsn production -user yourId -passwd yourPassowrd -inputsql star-schema.sql

#Download and check the data files
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/DimCustomer.sql
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/DimMonth.sql
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/FactBilling.sql
ls *.sql

#Run the commands below to load the data on to the production data warehouse
db2cli execsql -dsn production -user yourId -passwd yourPassowrd -inputsql DimCustomer.sql
db2cli execsql -dsn production -user yourId -passwd yourPassowrd -inputsql DimMonth.sql
db2cli execsql -dsn production -user yourId -passwd yourPassowrd -inputsql FactBilling.sql

#Download the verification sql file.
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Populating%20a%20Data%20Warehouse/verify.sql

#Verify the data in the data warehouse
db2cli execsql -dsn production -user yourId -passwd yourPassowrd -inputsql verify.sql

#Work with db2cli interactive command line
db2cli execsql -dsn production -user yourId -passwd yourPassowrd

#And check(If finish quit)
select count(*) from DimMonth;



