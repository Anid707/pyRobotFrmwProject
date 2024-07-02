*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://demowebshop.tricentis.com/register

*** Test Cases ***
RegTest
    open browser    ${url}  ${browser}
    maximize browser window
    ${implicit_time}=   get selenium implicit wait
    log to console    ${implicit_time}
    set selenium implicit wait    10 seconds        #waiting 10sec only if it cannot find element
    ${implicit_time}=   get selenium implicit wait
    log to console    ${implicit_time}

    select radio button    Gender       F
    input text    name:FirstName        David
    input text    name:LastName        John
    input text    name:Email        test777@gmail.com
    input text    name:Password        davidjohn
    input text    name:ConfirmPassword        davidjohn


