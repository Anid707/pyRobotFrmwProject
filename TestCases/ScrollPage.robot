*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}      https://www.countries-ofthe-world.com/flags-of-the-world.html   chrome

*** Test Cases ***
TC1
    open browser        ${url}      ${browser}
    maximize browser window
    press key    id:logo    Enter
    execute javascript    window.scrollTo(0,2500)
    sleep    5
    scroll element into view    xpath://td[contains(text(),'Kazakhstan')]
    sleep    5
    execute javascript    window.scrollTo(0, document.body.scrollHeight)    #to bottom
    execute javascript    window.scrollTo(0, -document.body.scrollHeight)    #to top
