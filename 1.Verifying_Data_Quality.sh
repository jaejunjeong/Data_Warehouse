# Start postgres
start_postgres

# Download the staging area setup script.
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/setup_staging_area.sh

# Run the command below to execute the staging area setup script.
bash setup_staging_area.sh

# Download the staging area setup script.
wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/dataqualitychecks.py

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/dbconnect.py

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/mytests.py

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0260EN-SkillsNetwork/labs/Verifying%20Data%20Quality%20for%20a%20Data%20Warehouse/generate-data-quality-report.py

# Install the python driver for Postgresql. (Use 'python3 -m pip install psycopg2' if does not work)
pip install psycopg2

# Check Postgresql python driver is installed properly, check Postgresql server is up and running, check our micro framework can connect to the database.
python3 dbconnect.py

# Install pandas, tabulate
python3 -m pip install pandas
python3 -m pip install tabulate

# Run the command below to generate a sample data quality report.
python3 generate-data-quality-report.py

: << "END"           
The file mytests.py contains all the data quality tests.
It provides a quick and easy way to author and run new data quality tests.
The testing framework provides the following tests:

checkfornulls - this test will check for nulls in a column
checkformin_max - this test will check if the values in a column are with a range of min and max values
checkforvalid_values - this test will check for any invalid values in a column
checkforduplicates - this test will check for duplicates in a column
Each test can be authored by mentioning a minimum of 4 parameters.

testname - The human readable name of the test for reporting purposes
test - The actual test name that the testing micro framework provides
table - The table name on which the test is to be performed
column - The table name on which the test is to be performed
END    

# Run the command below to generate the new data quality report(Whether pass the test or not)
python3 generate-data-quality-report.py

#You can change the condition by adjusting the mytests.py file (Four tests: check_for_nulls, check_for_min_max, check_for_valid_values, check_for_duplicates)
