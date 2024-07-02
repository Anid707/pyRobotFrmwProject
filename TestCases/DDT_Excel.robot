*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/login_resources.robot
Library         DataDriver  ../TestData/RobotFr_DataDriverTest.xlsx
Suite Setup     Open the Browser
Suite Teardown    Close Browsers
Test Template    Invalid Login

*** Test Cases ***
LoginTestExcel using ${username} ${password}
log     ${username}
log     ${password}

*** Keywords ***
Invalid Login
    [Arguments]    ${username}  ${password}
    Input Username    ${username}
    Input Password    ${password}
    click login button
    Error message should be visible