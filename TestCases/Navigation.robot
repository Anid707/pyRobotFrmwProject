*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url1}  https://www.google.com
${url2}  https://www.bing.com

*** Test Cases ***
NavigationTest
    open browser    ${url1}  ${browser}
    ${loc}=     get location      #https://www.google.com/
    log to console    ${loc}

    go to    ${url2}
    ${loc}=     get location    #https://www.bing.com
    log to console    ${loc}

    go back
    ${loc}=     get location    #https://www.google.com/
    log to console    ${loc}