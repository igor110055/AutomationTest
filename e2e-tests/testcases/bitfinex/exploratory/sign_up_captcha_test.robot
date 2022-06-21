*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/signup_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Production
Suite Teardown    Close Test Application

*** Test Cases ***
signup_captcha
    Tap Sign Up Button
    Generate Unique String
    Submit Sign Up    vuongvvv    vuongvvv+${UNIQUE_STRING}@gmail.com    Logi@1234    Logi@1234    country=Vietnam    confirm_password_check=${True}    referrer_code=PUB_ktE_3NzuW
    FOR    ${index}    IN RANGE    0    10
        Tap Submit Sign Up Button
        Verify Label Displays    The email and/or username has been taken    
    END