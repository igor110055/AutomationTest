*** Settings ***
Resource    ../../resources/locators/android/bitfinex/order_detail_locators.robot
Resource    ../../../utility/common/locator_common.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Tap Order Detail Field
    [Arguments]    ${field}
    ${field_element}    Generate Element From Dynamic Locator    ${lbl_order_detail_field_by_text}    ${field}
    Click Visible Element    ${field_element}    delay=1s