*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
LoginTC
    open browser    ${url}  ${browser}
    maximize browser window
    set screenshot directory        C:/Users/HP/PycharmProjects/pyRobotFrmwProject/screenshots/
    set selenium implicit wait    5seconds
    input text      name:username1     Admin
    input text      name:password     admin123

    capture element screenshot      xpath://*[@class='orangehrm-login-branding']/img      C:/Users/HP/PycharmProjects/pyRobotFrmwProject/screenshots/Logo.png
    capture page screenshot     C:/Users/HP/PycharmProjects/pyRobotFrmwProject/screenshots/Login.png