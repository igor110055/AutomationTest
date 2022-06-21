*** Settings ***
Resource    ../../resources/locators/android/bitfinex/change_pin_code_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Update Pin Code
    [Arguments]    ${old_pin}    ${new_pin}
    Input Text Into Element    ${txt_old_pin_code}    ${old_pin}
    Input Text Into Element    ${txt_new_pin_code}    ${new_pin}
    Input Text Into Element    ${txt_confirm_new_pin_code}    ${new_pin}
    Click Visible Element    ${btn_update_change_pin_code}