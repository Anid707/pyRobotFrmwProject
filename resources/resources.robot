*** Settings ***
Library         SeleniumLibrary

*** Keywords ***
launchBrowser
    [Arguments]    ${app_url}   ${app_browser}
    open browser    ${app_url}   ${app_browser}
    maximize browser window
    ${title}=   get title
    [Return]    ${title}