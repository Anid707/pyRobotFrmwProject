*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${login_url}    https://admin-demo.nopcommerce.com/
${browser}      chrome

*** Keywords ***
Open the Browser
    open browser    ${login_url}   ${browser}
    maximize browser window

Close Browsers
    close all browsers

Open Login Page
    go to    ${login_url}

Input Username
    [Arguments]    ${username}
    input text    id:Email      ${username}

Input Password
    [Arguments]    ${password}
    input text    id:Password   ${password}

Click Login Button
    click element    xpath://button[contains(text(),'Log in')]

Click Logout Link
    click link    Logout

Error message should be visible
    page should contain    Login was unsuccessful

Dashboard page should be visible
    page should contain    Dashboard
