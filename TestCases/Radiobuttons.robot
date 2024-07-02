*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}      https://demo.nopcommerce.com/

*** Test Cases ***
Test Radio Buttons and Checkboxes
    open browser    ${url}  ${browser}
    maximize browser window
    set selenium speed  2seconds

    click link  xpath://a[@class='ico-register']
    select radio button     Gender  F

    scroll element into view    Newsletter
    select checkbox     Newsletter
    unselect checkbox   Newsletter
    #sleep   3
