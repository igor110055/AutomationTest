*** Settings ***
Resource    ../../resources/locators/android/bitfinex/permissions_locators.robot

*** Keywords ***
Verify Checkbox By Name
    [Arguments]    ${name}    ${checked}=${False}
    ${checkbox_element}    Generate Element From Dynamic Locator    ${chk_permission_by_name}    ${name}
    Verify Checkbox State    ${checkbox_element}    ${checked}