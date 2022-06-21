*** Settings ***
Resource    ../../resources/locators/android/bitfinex/login_locators.robot

*** Keywords ***
Close Login Screen
    Click Visible Element    ${btn_close_login_screen}
    
Tap On Add Key
    Click Visible Element    ${tab_add_key}
    
Login Bitfinex
    [Arguments]    ${public_key}    ${secret_key}
    Input Text Into Element    ${txt_public_key}    ${public_key}    clear_text=${True}
    Input Text Into Element    ${txt_secret_key}    ${secret_key}    clear_text=${True}
    Click Visible Element    ${btn_login_on_login_screen}

Login Using Email
    [Arguments]    ${email}    ${password}
    Input Text Into Element    ${txt_email}    ${email}
    Input Text Into Element    ${txt_password}    ${password}
    Click Visible Element    ${btn_login_with_email}
    
Enter Pin Code
    [Arguments]    ${pin_code}=8
    Tap Element By Label    ${pin_code}
    Tap Element By Label    ${pin_code}
    Tap Element By Label    ${pin_code}
    Tap Element By Label    ${pin_code}
    Sleep   1s

Close Get Started Modal
    Click Visible Element    ${btn_close_on_get_started_modal}    

Close New Feature Modal
    Click Visible Element    ${btn_close_on_get_started_modal}

Tap While Using The App Button
    Click Visible Element    ${btn_whilte_using_the_app}

Verify New Feature Modal
    Wait Element Is Visible    ${btn_learn_more_on_new_feature_screen}
    Wait Element Is Visible    ${btn_no_thanks_on_new_feature_screen}
    Wait Element Is Visible    ${lbl_new_feature_on_new_feature_screen}   
    
Verify Get Started Modal
    Wait Element Is Visible    ${lbl_get_started_on_get_started_modal}
    
Verify Login Screen
    Wait Element Is Visible    ${tab_scan_qr}
    Wait Element Is Visible    ${tab_add_key}
    Wait Element Is Visible    ${btn_need_login_help}