*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/login_resources.robot
Suite Setup     Open the Browser
Suite Teardown    Close Browsers
Test Template    Invalid Login

*** Test Cases ***
Correct user empty pass     admin@yourstore.com     ${EMPTY}
Correct user wrong pass       admin@yourstore.com     xyz
Wrong user correct pass       admin1@yourstore.com     admin
Wrong user empty pass       admin1@yourstore.com     ${EMPTY}
Wrong user wrong pass       admin1@yourstore.com     xyz

*** Keywords ***
Invalid Login
    [Arguments]    ${username}  ${password}
    Input Username    ${username}
    Input Password    ${password}
    click login button
    Error message should be visible