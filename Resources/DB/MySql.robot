*** Settings ***
Library  DatabaseLibrary
Library  String
Library  Dialogs
*** Variables ***
${MYSQL_DB_MODULE} =  pymysql
${DB_NAME} =  ahmedd
${DB_USER_NAME} =  root
${DB_USER_PASSWORD} =  ""
${DB_HOST} =  127.0.0.1
${DB_PORT} =  3306
${PREVIOUS_ROW_COUNT}

*** Keywords ***
# replace the server & credentials with your own
Connect
    # Haven't figured out how to use variables for MySql connection string yet
    #Connect To Database  ${MYSQL_DB_MODULE}  ${DB_NAME}  ${DB_USER_NAME}  ${DB_USER_PASSWORD}  ${DB_HOST}  ${DB_PORT}
    Connect To Database Using Custom Params  pymysql  database='ahmedd', user='root', password="", host='127.0.0.1', port=3306

Save Current Row Count
    ${current_row_count} =  Row Count  SELECT * FROM birds;
    Set Suite Variable  ${PREVIOUS_ROW_COUNT}  ${current_row_count}
    Log  ${current_row_count}

Get Input Data
    # from the dialogs library
    ${name} =  Get Value From User  Enter a scientific_name
    ${common} =  Get Value From User  Enter a common_name
    # save it at the suite scope so subsequent test can use it
    Set Suite Variable  ${ScientificName}  ${name}
    Set Suite Variable  ${CommonName}  ${common}

Insert Record
    # Optional: Use these commented lines to create your table if necessary
    #Delete All Rows From Table  DemoItems
    #Execute SQL String  DROP TABLE DemoItems
    #Execute SQL String  CREATE TABLE DemoItems (ItemId INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, ItemName VARCHAR(50) NOT NULL, FirstName VARCHAR(50) NOT NULL)

    # I wasn't able to get a DateTime value inside the query like I did on SQL Server
    # so had to do it on a separate line. This is from the DateTime library.
    # For some reason, Pycharm/Intellibot doesn't recognize it and underlines it

    # notice I've put the variables inside single quotes
    ${insert_command} =  Set Variable  INSERT INTO birds (scientific_name, common_name) VALUES ('${ScientificName}', '${CommonName}')
    Execute SQL String  ${insert_command}

Verify New Record Added
    ${new_row_count} =  Row Count  SELECT * FROM birds;
    Log  ${new_row_count}
    # notice that I'm using +1 INSIDE the braces, not after the final brace
    Should be Equal as Numbers  ${new_row_count}  ${PREVIOUS_ROW_COUNT + 1 }

Verify Last Record
    # notice here we use LIMIT 1 instead of TOP 1 in SQL Server
    ${queryResults} =  Query  SELECT * FROM birds ORDER BY bird_id DESC LIMIT 1
    # Examine the (0-based) 3rd field of the first record in the results
    Should be Equal as Strings  ${queryResults[0][2]}  ${CommonName}
    Log  ${queryResults[0][2]}

Log All Rows
    ${queryResults} =  Query  SELECT * FROM birds ORDER BY bird_id
    Log Many  ${queryResults}

Disconnect
    Disconnect From Database
