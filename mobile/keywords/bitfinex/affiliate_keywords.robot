*** Settings ***
Resource    ../../resources/locators/android/bitfinex/affiliate_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Affiliate Screen Displays
    Wait Element Is Visible    ${lbl_overview_affiliate}    30s
    Wait Element Is Visible    ${btn_generate_new_code_affiliate}    30s