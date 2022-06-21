*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot
Resource    ../../../../mobile/keywords/bitfinex/login_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/account_keywords.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Variables ***
${invalid_api_key}    kYPR5q7rrIkNJuzg9dF46pDIeMgDaQPuybXR9WASKda
${invalid_api_secret}    15r6z1hPBbRsQk7cSZJ8enc11Cf2kNrOasAZc6E613K
${less_than_43_chars_api_key}    kYPR5q7rrIkNJuzg9dF46pDIeMgDaQPuybXR9WASKd
${less_than_43_chars_api_secret}    15r6z1hPBbRsQk7cSZJ8enc11Cf2kNrOasAZc6E613
${invalid_email}    vuongvvv1@gmail.com
${invalid_password}    invalid_password
${prod_no_u2f_2fa_username}    v0605224
${prod_no_u2f_2fa_password}    Logi@1234

*** Test Cases ***
forgot_password_link
    Verify Pulse Button Displays
    Tap On Navigation Tab By Name    Account
    Logout Bitfinex App
    Verify Login Panel
    Tap On Login Button
    Tap Element By Label    Forgot Password?
    Verify Label Displays    Request Password Reset

sign_up_link
    Tap Device Back Button
    Tap Element By Label    Sign Up
    Verify Label Displays    Create account
    Tap Close Icon

login_logout_test
    Tap On Login Button
    Tap Element By Label    API Key
    Tap On Add Key
    Login Bitfinex    ${invalid_api_key}    ${invalid_api_secret}
    Login Bitfinex    ${less_than_43_chars_api_key}    ${less_than_43_chars_api_secret}
    Verify Label Displays    Public API key must have length in 43 symbols
    Verify Label Displays    Secret API key must have length in 43 symbols

login_invalid_email
    Tap Close Icon
    Tap On Login Button
    Login Using Email    ${invalid_email}    ${invalid_password}
    Verify Label Displays    Incorrect username/email and/or password
    
login_email
    Close Test Application
    Open Apps    Bitfinex
    Login With Email    ${TEST_DATA_FULL_VERIFIED_EMAIL}    ${TEST_DATA_FULL_VERIFIED_PASSWORD}    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    Staging
    
login_email_invalid_otp
    Close Test Application
    Open Apps    Bitfinex
    Logout Bitfinex On Pincode Screen
    Tap On Navigation Tab By Name    Account
    Choose Server    Staging
    Tap On Login Button
    Login Using Email    ${TEST_DATA_FULL_VERIFIED_EMAIL}    ${TEST_DATA_FULL_VERIFIED_PASSWORD}
    Input 2FA Code    ytdfeja7dt4xruyg
    Verify Label Displays    Token auth denied. Please try again.
    
login_username
    Close Test Application
    Open Apps    Bitfinex
    Login With Email    ${TEST_DATA_FULL_VERIFIED_USERNAME}    ${TEST_DATA_FULL_VERIFIED_PASSWORD}    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    Staging
    
login_no_u2f_2fa
    Close Test Application
    Open Apps    Bitfinex
    Login With Email    ${prod_no_u2f_2fa_username}    ${prod_no_u2f_2fa_password}    ${TEST_DATA_FULL_VERIFIED_2FA_SECRET}    Production