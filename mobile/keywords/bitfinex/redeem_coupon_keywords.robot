*** Settings ***
Resource    ../../resources/locators/android/bitfinex/redeem_coupon_locators.robot

*** Keywords ***
Redeem Coupon Code
    [Arguments]    ${coupon_code}
    Input Text Into Element    ${txt_coupon_code}    ${coupon_code}
    Click Visible Element    ${btn_redeem_coupon}
    
Tap Help Infor Button
    Click Visible Element    ${btn_help_infor}