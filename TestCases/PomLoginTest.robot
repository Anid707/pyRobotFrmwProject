*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/pom_login_keywords.robot

*** Variables ***
${browser}      chrome
${site_url}     https://admin-demo.nopcommerce.com/login
${username}     admin@yourstore.com
${password}     admin

*** Test Cases ***
LoginTest
    Open the browser    ${site_url}     ${browser}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Sign In
    sleep    3 seconds
    Verify Successful Login
    close all browsers