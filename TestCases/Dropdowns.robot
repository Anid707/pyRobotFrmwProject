*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  headlesschrome
${url}  https://demo.nopcommerce.com/

*** Test Cases ***
Hadling Dropdowns and Lists
    open browser    ${url}  ${browser}
    maximize browser window
    set selenium speed  1second

    click link  xpath://a[@class='ico-register']
    select from list by label    DateOfBirthDay     10
    select from list by index    DateOfBirthDay     1
    select from list by value    DateOfBirthDay     5