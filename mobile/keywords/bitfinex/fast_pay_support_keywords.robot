*** Settings ***
Resource    ../../resources/locators/android/bitfinex/fast_pay_support_locators.robot

*** Keywords ***
Close Fast Pay Support Screen
    Click Visible Element    ${btn_close_fast_pay_support}