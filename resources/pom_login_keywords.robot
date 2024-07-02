*** Settings ***
Library         SeleniumLibrary
Variables       ../PageObjects/Locators.py

*** Keywords ***
Open the Browser
    [Arguments]    ${site_url}   ${browser}
    open browser    ${site_url}   ${browser}
    maximize browser window

Enter Username
    [Arguments]    ${username}
    input text    ${txt_loginUsername}      ${username}

Enter Password
    [Arguments]    ${password}
    input text    ${txt_loginPassword}      ${password}

Click Sign In
    click button    ${btn_signin}

Verify Successful Login
    page should contain    Dashboard

Close browsers
    close all browsers
