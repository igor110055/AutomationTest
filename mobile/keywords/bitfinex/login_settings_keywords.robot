*** Settings ***
Resource    ../../resources/locators/android/bitfinex/login_settings_locators.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Update Timeout
    [Arguments]    ${timeout}
    Input Text Into Element    ${txt_timeout_login_settings}    ${timeout}
    Click Visible Element    ${btn_update_login_settings}