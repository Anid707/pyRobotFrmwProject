*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/resources.robot
Library         SeleniumLibrary
Resource        ../resources/resources.robot

*** Variables ***
${browser}  chrome
${url}  https://demo.guru99.com/test/newtours/

*** Test Cases ***
TC1
    ${page_title}=      launchBrowser   ${url}      ${browser}
    log to console    ${page_title}
    log    ${page_title}
    input text    name:userName     mercury
    input text    name:password     mercury

