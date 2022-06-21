*** Settings ***
Resource    ../../resources/locators/android/bitfinex/language_locators.robot
Resource    ../../../utility/common/locator_common.robot

Resource    ../common/mobile_common.robot
*** Keywords ***
Verify Language Screen Displays
    ${language_element}    Generate Element From Dynamic Locator    ${rdo_lanuage_language}    English
    Wait Element Is Visible    ${language_element}
    ${language_element}    Generate Element From Dynamic Locator    ${rdo_lanuage_language}    Русский
    Wait Element Is Visible    ${language_element}
    ${language_element}    Generate Element From Dynamic Locator    ${rdo_lanuage_language}    中文 (简化)
    Wait Element Is Visible    ${language_element}
    ${language_element}    Generate Element From Dynamic Locator    ${rdo_lanuage_language}    中文 (繁體)
    Wait Element Is Visible    ${language_element}
    ${language_element}    Generate Element From Dynamic Locator    ${rdo_lanuage_language}    Español
    Wait Element Is Visible    ${language_element}
    
Select Language
    [Arguments]    ${language}
    ${language_element}    Generate Element From Dynamic Locator    ${rdo_lanuage_language}    ${language}
    Click Visible Element    ${language_element}