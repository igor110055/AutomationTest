*** Settings ***
Resource    ../../resources/locators/testpad/testpad_common_locators.robot

*** Keywords ***
Login Testpad
    [Arguments]    ${email}    ${password}
    Input Text To Element    ${txt_email}    ${email}
    Input Text To Element    ${txt_password}    ${password}
    Click Visible Element    ${btn_login}