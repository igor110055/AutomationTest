*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/signup_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Logout And Select Server    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
cancel_signup
    Tap Sign Up Button
    Generate Unique String
    Submit Sign Up    v${UNIQUE_STRING}    vuongvvv+${UNIQUE_STRING}@gmail.com    Logi@1234    Logi@1234    country=Vietnam    confirm_password_check=${True}    referrer_code=PUB_ktE_3NzuW
    Enter Pin Code
    Enter Pin Code
    Tap Close Icon
    Verify Label Displays    If you abort the signup process now, the two-factor authentication will not be enabled on your account.
    Verify Label Displays    You can still login using the same email and password just created.
    Tap Element By Label    Confirm
    Verify Label Displays    TICKERS