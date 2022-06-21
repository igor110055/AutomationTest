*** Settings ***
Resource    ../../resources/locators/android/bitfinex/currency_conversion_locators.robot

Resource    common_keywords.robot
*** Keywords ***
Select From Dropdown Item
    [Arguments]    ${dropdown_item}
    Click Visible Element    ${drd_from}
    Input Text To Textbox    ${dropdown_item}
    Tap Element By Label    ${dropdown_item}    repeat=2

Select To Dropdown Item
    [Arguments]    ${dropdown_item}
    Click Visible Element    ${drd_to}
    Tap Element By Label    ${dropdown_item}

Input Conversion Amount
    [Arguments]    ${amount}
    Input Text Into Element    ${txt_amount}    ${amount}

Tap To Wallet Dropdown
    Click Visible Element    ${drd_to_wallet}

Tap Max Amount Button
    Click Visible Element    ${btn_max_amount}
    Sleep    1s

Select From Wallet Dropdown Item
    [Arguments]    ${from_item}
    Click Visible Element    ${drd_from_wallet}
    Tap Element By Label    ${from_item}

Verify Max Amount Populated
    ${balances_amount}    Get Element Text    ${txt_amount}
    ${populated_max_amount}    Get Element Text    ${lbl_balances_amount}
    Should Contain    ${populated_max_amount}    ${balances_amount}
    
Verify Conversion Dropdown Values
    [Arguments]    ${from_value}    ${to_value}
    Verify Element Text Should Be    ${drd_from}    ${from_value}    delay=1s
    Verify Element Text Should Be    ${drd_to}    ${to_value}    delay=1s
    
Verify Dropdowns Disappear In Lite Mode
    Wait Element Disappear    ${drd_to_wallet}
    Wait Element Disappear    ${drd_from_wallet}