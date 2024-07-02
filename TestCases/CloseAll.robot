*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://demowebshop.tricentis.com/register
${url1}  https://demo.nopcommerce.com/

*** Test Cases ***
CloseAllTest
    open browser    ${url}  ${browser}
    maximize browser window

    open browser    ${url1}  ${browser}
    maximize browser window

    close all browsers