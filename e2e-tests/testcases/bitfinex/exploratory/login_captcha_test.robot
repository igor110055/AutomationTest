*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Teardown    Close Test Application

*** Variables ***
${invalid_password}    Logi@12345
    
*** Test Cases ***
login_captcha
    Open Apps    Bitfinex
    Logout And Select Server    Production
    Tap On Login Button
    FOR    ${index}    IN RANGE    0    10
        Login Using Email    vuongvvv@gmail.com    ${invalid_password}
        Verify Label Displays    Incorrect username/email and/or password
    END