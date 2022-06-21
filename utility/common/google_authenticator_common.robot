*** Settings ***
Library    ../python_library/GoogleAuthenticator.py

*** Keywords ***
Get Google Authenticator Code
    [Arguments]    ${secret_key}
    ${otp_code}    Get Google Authenticator Onetime Otp    ${secret_key}
    [Return]    ${otp_code}