*** Settings ***
Resource    ../../resources/locators/android/bitfinex/withdraw_support_locators.robot
Resource    ../../../utility/common/locator_common.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Tap Help Link Withdraw Support
    [Arguments]    ${link_text}
    ${lnk_help}    Generate Element From Dynamic Locator    ${lnk_help_by_text_withdraw_support}    ${link_text}
    Click Visible Element    ${lnk_help}

Tap Close Button Withdraw Support
    Click Visible Element    ${btn_close_withdraw_support}