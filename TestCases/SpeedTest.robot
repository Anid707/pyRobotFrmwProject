*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://demowebshop.tricentis.com/register

*** Test Cases ***
RegTest
    open browser    ${url}  ${browser}
    maximize browser window
    set selenium speed    2 seconds

    select radio button    Gender       F
    input text    name:FirstName        David
    input text    name:LastName        John
    input text    name:Email        test777@gmail.com
    input text    name:Password        davidjohn
    input text    name:ConfirmPassword        davidjohn

    ${speed}=   get selenium speed
    log to console    ${speed}

