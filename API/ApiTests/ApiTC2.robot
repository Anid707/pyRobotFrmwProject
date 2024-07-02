*** Settings ***
Documentation    Robot Framework API Test
Library    Collections
Library    String
Library    JSONLibrary
Library    RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in/
${page_path}    $.page              #value of key=page from json
${id_path}      $.id

*** Test Cases ***
POST Request Test
    [Tags]    API
    create session    session1      ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users
    ${body}         create dictionary    name=Rohit     job=Software Engineer
    ${response}     post on session    session1      ${endpoint}    data=${body}
    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}      convert to string    ${response.status_code}
    should be equal    ${status_code}   201

    ${json_response}    convert string to json    ${response.content}
    ${contents}         get value from json    ${json_response}     ${id_path}
    should not be empty     ${contents}
