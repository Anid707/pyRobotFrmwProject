*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}      https://demo.nopcommerce.com/   chrome

*** Test Cases ***
GetAllLinksTest
    open browser    ${url}  ${browser}
    maximize browser window
    ${AlllinksCount}=   get element count    xpath://a
    log to console    ${AllLinksCount}

    @{LinkItems}=   create list

    FOR     ${i}    IN RANGE    1   ${AllLinksCount}+1
        ${linkText}=    get text    xpath:(//a)[${i}]
        log to console     ${\n}Num=${i}
        log to console      ${linkText}
    END