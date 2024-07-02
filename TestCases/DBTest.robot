*** Settings ***
Library         SeleniumLibrary
Library         DatabaseLibrary
Library         OperatingSystem

Suite Setup    Connect To Database      pymysql     ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
Suite Teardown    Disconnect From Database

*** Variables ***
${DBName}   mydatabase-dev
${DBUser}   root
${DBPass}   SQL&root123
${DBHost}   127.0.0.1
${DBPort}   3306

*** Test Cases ***
Create Person table
    ${output}   execute sql script    Create table person(id integer,first_name varchar(20),last_name varchar(20))
    log to console    ${output}
    should be equal as strings    ${output}     None

Insert Data into Person table
    ${output}   execute sql script    Insert into person values(101, "John", "Canady")
    log to console    ${output}
    should be equal as strings    ${output}     None

Insert Data from SQL file into Person table
    ${output}   execute sql script    ./TestData/sql-db-person-data.sql
    log to console    ${output}
    should be equal as strings    ${output}     None

Check David record present in Person table
    check if exists in database    select id from mydatabase-dev.person where first_name="David"

Check Jio record Not present in Person table
    check if not exists in database    select id from mydatabase-dev.person where first_name="Jio"

Check Person table present in database
    table must exist    person

Verify Row count is zero
    row count is 0    select * from mydatabase-dev.person where first_name="xyz"

Verify Row count is equal to some value
    row count is equal to x    select * from mydatabase-dev.person where first_name="David";  1

Verify Row count is less than some value
    row count is less than x    select * from mydatabase-dev.person where first_name="John";    2

Update record in Person table
    ${output}   execute sql script    Update mydatabase-dev set first_name="Jio" where id=101;
    log to console    ${output}
    should be equal as strings    ${output}     None

Retrieve records from Person table
    ${queryResults}   query    Select * from mydatabase-dev;
    log to console    log many    ${queryResults}

Delete records from Person table
    ${output}   execute sql script    Delete from mydatabase-dev where id>0;
    should be equal as strings    ${output}     None



