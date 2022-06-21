*** Settings ***
Resource    ../../resources/locators/android/bitfinex/fast_pay_locators.robot
Resource    ../../../utility/common/string_common.robot
*** Keywords ***
Tap Withdraw Support Icon
    Click Visible Element    ${btn_support_icon}

Toggle BTC SAT View Mode
    Click Visible Element    ${btn_toggle_btc_sat}
    Sleep    1s
    
Tap Fast Pay Config Icon
    Click Visible Element    ${btn_fast_pay_config_icon}

Tap Fast Pay Support Icon
    Click Visible Element    ${btn_fast_pay_support_icon}

Tap Scan Button
    Click Visible Element    ${btn_scan}

Tap Enter Address Link
    Click Visible Element    ${lnk_enter_address}

Submit Invoice
    [Arguments]    ${invoice_address}    ${enter_method}=input    ${submit}=${True}
    Run Keyword If    '${enter_method}'=='input'    Input Text Into Element    ${txt_enter_address}    ${invoice_address}
    ...    ELSE    Click Visible Element    ${btn_paste_address_icon}
    Run Keyword If    ${submit}==${True}    Click Visible Element    ${btn_okay}    delay=5s    

Tap Pay Button
    Click Visible Element    ${btn_pay}    delay=2s

Submit 2FA Token
    [Arguments]    ${2fa_token}
    Input Text Into Element    ${txt_2fa_token}    ${2fa_token}
    Click Visible Element    ${btn_authenticate_fast_pay}

Tap Home Button On Payment Completed Screen
    Click Visible Element    ${btn_home_payment_completed}

Swipe To Next Payment Transport
    Sleep    2s
    ${return_values}    Get Element Boundary Values    ${drd_payment_transport}
    ${x_end}    Convert To Integer    ${return_values}[2]
    ${y_end}    Convert To Integer    ${return_values}[3]
    ${x_start}    Evaluate    ${x_end} - 100
    ${y_start}    Evaluate    ${y_end} * 0.5
    Swipe    ${x_start}    ${y_start}    500    0
    Sleep    2s

Input Amount To Send
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_amount}    ${amount}

Tap Receive Button
    Click Visible Element    ${btn_receive}
    
Input Amount To Receive
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_amount}    ${amount}

Tap Generate Invoice
    Click Visible Element    ${btn_generate_invoice}

Tap Receive Amount Equivalent Swap Button
    Click Visible Element    ${btn_receive_swap}

Get Invoice Code
    [Arguments]    ${pay_by}    ${return_var}
    ${invoice_element}    Run Keyword If    "${pay_by}"=="ln-btc"    Set Variable    ${lbl_ln_btc_invoice_code}
    ...    ELSE    Set Variable    ${lbl_tether_ethereum_invoice_code}
    Swipe Down To Element    ${invoice_element}
    ${invoice_code}    Get Element Text    ${invoice_element}
    Click Visible Element    ${invoice_element}
    Set Suite Variable    ${${return_var}}    ${invoice_code}

# ACCOUNT - FAST PAY
Config Small Payments To Skip 2FA
    [Arguments]    ${amount}
    Click Visible Element    ${btn_fastpay_setting_skip_2fa}
    Input Text To Textbox    ${amount}
    Tap Element By Label    Okay

# LITE MODE ONLY
Tap Close Fast Pay Button On Lite Mode
    Click Visible Element    ${btn_close_fast_pay_on_lite_mode}

Tap Pay Support Infor On Lite Mode
    Click Visible Element    ${btn_support_infor_on_lite_mode}

# RECENT TRANSACTIONS    
Tap Recent Transaction Record
    [Arguments]    ${index}
    ${row_element}    Generate Element From Dynamic Locator    ${row_recent_transactions_by_index}    ${index}
    Click Visible Element    ${row_element}
    
Verify Fast Pay Screen Displays
    Wait Element Is Visible    ${btn_toggle_btc_sat}
    
Verify View Mode
    [Arguments]    ${expected_view_mode}
    ${element_text}    Get Element Text    ${lbl_view_mode}
    Run Keyword If    "${expected_view_mode}"=="BTC"    Should Contain    ${element_text}    .
    ...    ELSE    Should Contain    ${element_text}    ,

Verify LN BTC Invoice Is Generated
    Swipe Down To Element    ${lbl_ln_btc_invoice_code}
    Wait Element Is Visible    ${lbl_ln_btc_invoice_code}
    ${invoice_text}    Get Element Text    ${lbl_ln_btc_invoice_code}
    Verify String Is Lower Case    ${invoice_text}
    
Verify BTC SAT Mode On Receive
    [Arguments]    ${expected_mode}
    ${mode_element}    Generate Element From Dynamic Locator    ${lbl_btc_sat_mode_on_receive}    ${expected_mode}
    Wait Element Is Visible    ${mode_element}
    
Verify Equivalent Amount Displays In Mode
    [Arguments]    ${mode}
    ${equivalent_amount_label}    Get Element Text    ${lbl_equivalent_amount}
    Should Contain    ${equivalent_amount_label}    ${mode}
    
Verify Second Part Of Receive Amount Displays In Mode
    [Arguments]    ${mode}
    Sleep    1s
    Verify Element Text Should Be    ${lbl_receive_amount_second_part}    ${mode}
    
Verify First Part Of Receive Amount Displays In Mode
    [Arguments]    ${mode}
    Verify Element Text Should Be    ${txt_amount}    ${mode}