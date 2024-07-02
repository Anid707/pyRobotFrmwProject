*** Settings ***
Documentation    Robot Framework API Test
Library    Collections
Library    String
Library    JSONLibrary
Library    RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in/
${page_path}    $.page              #value of key=page from json

*** Test Cases ***
GET Request Test
    [Tags]    API
    create session    session1      ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users?page=2
    ${response}     get on session    session1      ${endpoint}
    log to console    response.headers ${response.headers}
    log to console    response.status_code ${response.status_code}
    log to console    response.content ${response.content}          #{"page": 2}
    log               ${response.content}

    #Validations
    ${status_code}      convert to string    ${response.status_code}
    should be equal     ${status_code}      200

    ${json_response}    convert string to json    ${response.content}     #{'page': 2}
    log to console    json_response ${json_response}
    ${contents}         get value from json    ${json_response}     ${page_path}     #get value of key=page from json
    log to console    contents ${contents}                                  #[2]
    ${contents}         convert to string    ${contents}
    log to console    contents ${contents}                                  #[2]
    ${contents}         remove string using regexp    ${contents}       ['\\[\\],]      #remove []brackets
    log to console    contents ${contents}                                   #2
    should be equal    ${contents}  2

    ${header_value}     get from dictionary    ${response.headers}      Content-Type
    should be equal     ${header_value}     application/json; charset=utf-8

    log to console      ${response.cookies}
    ${cookie_value}     get from dictionary    ${response.cookies}      __stripe_mid
    log to console      ${cookie_value}
