*** Settings ***
Resource    ../../resources/locators/android/bitfinex/two_factor_authentication_locators.robot
Resource    ../../../utility/common/google_authenticator_common.robot

*** Keywords ***
Input 2FA Code
    [Arguments]    ${2fa_secret}    ${wait}=${None}
    Sleep    2s
    ${otp_code}    Get Google Authenticator Code    ${2fa_secret}
    Input Text To Textbox     ${otp_code}
    Tap Element By Label    Authenticate
    Run Keyword If    '${wait}'!='${None}'    Sleep    ${wait}
    
Submit Tamper Proof Confirmation
    [Arguments]    ${confirmation_code}
    Input Text Into Element    ${txt_tamper_proof_confirmation}    ${confirmation_code}
    Click Visible Element    ${btn_submit_tamper_proof_confirmation}    delay=2s