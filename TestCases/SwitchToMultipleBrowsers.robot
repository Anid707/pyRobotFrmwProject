*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://demowebshop.tricentis.com/register
${url1}  https://demo.nopcommerce.com/

*** Test Cases ***
MutipleBrowsersSwitchTest
    open browser    ${url}  ${browser}
    maximize browser window

    sleep    3

    open browser    ${url1}  ${browser}
    maximize browser window

    switch browser    1
    ${title1}=   get title
    log to console    ${title1}

    switch browser    2
    ${title2}=   get title
    log to console    ${title2}