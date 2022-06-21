*** Settings ***
Resource    ../../resources/locators/android/bitfinex/support_center_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Support Center Screen Displays
    Wait Element Is Visible    ${btn_log_in_support_center}    20s
    Wait Element Is Visible    ${lbl_contact_bitfinex_support_support_center}	20s