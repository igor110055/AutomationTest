*** Settings ***
Resource    ../../resources/locators/android/bitfinex/live_chat_locators.robot
Resource    ../../../utility/common/locator_common.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Send Message
    [Arguments]    ${message}
    Wait Element Is Visible    ${txt_type_message}    60s
    Input Text Into Element    ${txt_type_message}    ${message}
    Click Visible Element    ${btn_send_message}    delay=1s
    
Verify Message In Live Chat Panel
    [Arguments]    ${message}
    ${text_element}    Generate Element From Dynamic Locator    ${lbl_text_in_chat_panel}    ${message}
    Wait Element Is Visible    ${text_element}