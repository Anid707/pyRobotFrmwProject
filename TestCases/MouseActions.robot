*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url1}  https://swisnl.github.io/jQuery-contextMenu/demo.html
${url2}  https://testautomationpractice.blogspot.com/
${url3}  http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html

*** Test Cases ***
MouseActionsTC
    open browser    ${url1}  ${browser}
    maximize browser window
    set screenshot directory        C:/Users/HP/PycharmProjects/pyRobotFrmwProject/screenshots/
    set selenium implicit wait    5seconds

    #Right click
    open context menu    xpath://span[contains(text(),'right click me')]
    sleep    3

    #Double click
    go to   ${url2}
    maximize browser window
    double click element    xpath://button[contains(text(),'Copy Text')]
    sleep    3

    #Drag and drop
    go to   ${url3}
    maximize browser window
    drag and drop    id:box6    id:box106
    sleep    5

    close browser