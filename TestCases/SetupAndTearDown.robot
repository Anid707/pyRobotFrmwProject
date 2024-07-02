*** Settings ***
Library         SeleniumLibrary
Suite Setup     log to console      Opening Browser
Suite Teardown    log to console      Closing Browser

Test Setup    log to console      Login to app
Task Teardown    log to console      Logout from app

*** Test Cases ***
TC1 Prepaid Recharge
    [Tags]    regression
    log to console      This is prepaid recharge test case
TC2 Postpaid Recharge
    [Tags]    regression
    log to console      This is postpaid recharge test case
TC3 Search
    [Tags]    sanity
    log to console      This is Search test case
TC4 Advanced Search
    [Tags]    sanity
    log to console      This is Adv Search test case