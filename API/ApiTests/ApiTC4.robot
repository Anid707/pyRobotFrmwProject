*** Settings ***
Documentation    Robot Framework API Test
Library    Collections
Library    String
Library    JSONLibrary
Library    RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in/

*** Test Cases ***
Delete Request Test
    [Tags]    API
    create session    session1      ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users/122
    ${response}     delete on session    session1      ${endpoint}
    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}      convert to string    ${response.status_code}
    should be equal    ${status_code}   204

GET By Id Request Test
    [Tags]    API
    create session    session1      ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users/122
    ${response}     get on session    session1      ${endpoint}
    log to console    response.status_code ${response.status_code}
    log to console    response.content ${response.content}

    #Validations
    ${status_code}      convert to string    ${response.status_code}
    #should be equal     ${status_code}      404