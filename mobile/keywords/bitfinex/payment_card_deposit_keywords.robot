*** Settings ***
Resource    ../../resources/locators/android/bitfinex/payment_card_deposit_locators.robot

*** Keywords ***
Tap Min Amount Button
    Click Visible Element    ${btn_min_payment_card_deposit}    delay=3s
    
Tap Max Amount Button
    Click Visible Element    ${btn_max_payment_card_deposit}    delay=3s
    
Tap TOS Agree Checkbox
    Click Visible Element    ${chk_tos_agree_payment_card_deposit}    swipe=DOWN
    
Tap Submit Button
    Click Visible Element    ${btn_submit_payment_card_deposit}    swipe=DOWN
    
Tap Okay On Please Confirm Popup
    Click Visible Element    ${btn_ok_please_confirm_payment_card_deposit}
    
Select Deposit Currency
    [Arguments]    ${deposit_currency}
    Click Visible Element    ${drd_deposit_currency}
    ${deposit_currency_element}    Generate Element From Dynamic Locator    ${drd_payment_card_item}    ${deposit_currency}
    Click Visible Element    ${deposit_currency_element}    delay=1s
    
Select Deposit Currency Fiat
    [Arguments]    ${deposit_currency_fiat}
    Tap Deposit Currency Fiat Dropdown
    ${deposit_currency_element}    Generate Element From Dynamic Locator    ${drd_payment_card_item}    ${deposit_currency_fiat}
    Click Visible Element    ${deposit_currency_element}    delay=1s

Tap Deposit Currency Fiat Dropdown
    Click Visible Element    ${drd_deposit_currency_fiat}

Input Amount On Payment Card Deposit
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_fiat_amount}    ${amount}
    
Verify Deposit Amount Value
    [Arguments]    ${expected_value}
    ${deposit_amount}    Get Element Text    ${txt_deposit_amount}
    Run Keyword And Continue On Failure    Should Contain    ${deposit_amount}    ${expected_value}
    
Verify Fiat Amount Value
    [Arguments]    ${expected_value}
    ${fiat_amount}    Get Element Text    ${txt_fiat_amount}
    Run Keyword And Continue On Failure    Should Contain    ${fiat_amount}    ${expected_value}
    
Verify To Wallet Dropdown Disappear
    Wait Element Disappear    ${drd_to_wallet}