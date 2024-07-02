*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://demo.nopcommerce.com/

*** Test Cases ***
LoginTest
    #create webdriver    chrome      executable_path="C:\Users\HP\AppData\Local\Programs\Python\Python312\Scripts\chromedriver.exe"
    open browser    ${url}  ${browser}
    loginToApp
    close browser

*** Keywords ***
loginToApp
    click link  xpath://a[@class='ico-login']
    input text  id:Email        test123@gmail.com
    input text  id:Password     Anya@123
    click element   xpath://button[@class='button-1 login-button']