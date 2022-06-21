*** Settings ***
Resource    ../../resources/locators/android/bitfinex/create_account_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Fill Account Information
    [Arguments]    ${username}=${None}    ${email}=${None}    ${password}=${None}    ${confirm_password}=${None}    ${tap_password_acknowledge}=${False}
    Run Keyword If    '${username}'!='${None}'    Input Text Into Element    ${txt_username}    ${username}    clear_text=${True}
    Run Keyword If    '${email}'!='${None}'    Input Text Into Element    ${txt_email}    ${email}    clear_text=${True}
    Run Keyword If    '${password}'!='${None}'    Input Text Into Element    ${txt_password}    ${password}    clear_text=${True}
    Run Keyword If    '${confirm_password}'!='${None}'    Input Text Into Element    ${txt_confirm_password}    ${confirm_password}    
    Run Keyword If    ${tap_password_acknowledge}==${True}    Click Visible Element    ${chk_confirmation}    
    
Close Login Screen
    Click Visible Element    ${btn_close_create_account_screen}
    
Create Account
    [Arguments]    ${username}=${None}    ${email}=${None}    ${password}=${None}    ${confirm_password}=${None}    ${tap_password_acknowledge}=${False}
    Fill Account Information    ${username}    ${email}    ${password}    ${confirm_password}    ${tap_password_acknowledge}
    Click Visible Element    ${btn_sign_up_create_account}

Tap Back On Cancel Signup Popup
    Click Visible Element    ${btn_back_cancel_signup}

Tap View QR And Secret Code
    Click Visible Element    ${btn_view_qr_and_secret_code}    

Copy Secret Code
    [Arguments]    ${return_name}
    ${secret_code}    Get Element Text    ${txt_secret_code_copy_secret_code}
    Set Test Variable    ${${return_name}}    ${secret_code}
        
Verify Username Validation Message
    [Arguments]    ${expected_message}
    Verify Element Text Should Be    ${lbl_username_validation_message_sign_up}    ${expected_message}    1s
    
Verify Email Validation Message
    [Arguments]    ${expected_message}
    Verify Element Text Should Be    ${lbl_email_validation_message_sign_up}    ${expected_message}    1s
    
Verify Password Validation Message
    [Arguments]    ${expected_message}
    Verify Element Text Should Be    ${lbl_password_validation_message_sign_up}    ${expected_message}    1s
    
Verify Confirm Password Validation Message
    [Arguments]    ${expected_message}
    Verify Element Text Should Be    ${lbl_confirm_password_validation_message_sign_up}    ${expected_message}    1s
    
Verify Sign Up Button Is Disabled
    Verify Element Is Disabled    ${btn_sign_up_create_account}