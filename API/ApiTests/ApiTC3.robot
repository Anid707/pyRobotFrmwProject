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
${name_path}    $.name

*** Test Cases ***
PUT Request Test
    [Tags]    API
    create session    session1      ${base_url}     disable_warnings=1
    ${endpoint}     set variable    /api/users/122
    ${body}         create dictionary    name=Virat     job=Data Engineer
    ${response}     put on session    session1      ${endpoint}    data=${body}
    log to console    ${response.status_code}
    log to console    ${response.content}

    #Validations
    ${status_code}      convert to string    ${response.status_code}
    should be equal    ${status_code}   200

    ${json_response}    convert string to json    ${response.content}
    ${contents}         get value from json    ${json_response}     ${name_path}
    ${contents}         convert to string    ${contents}
    log to console      contents ${contents}                                  #['Virat']
    ${contents}         remove string using regexp    ${contents}       ['\\[\\]']      #remove ['']brackets
    log to console      contents ${contents}
    should be equal     ${contents}     Virat

