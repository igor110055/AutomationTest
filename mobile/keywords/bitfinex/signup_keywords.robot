*** Settings ***
Resource    ../../resources/locators/android/bitfinex/signup_locators.robot
Resource    ../../../utility/common/string_common.robot

*** Keywords ***
Submit Sign Up
    [Arguments]    ${username}=${None}    ${email}=${None}    ${password}=${None}    ${confirm_password}=${None}    ${country}=${None}    ${region}=${None}    ${confirm_password_check}=${False}    ${referrer_code}=${None}
    Run Keyword If    '${username}'!='${None}'    Input Text Into Element    ${txt_username_signup}    ${username}    clear_text=${True}    swipe=UP
    Run Keyword If    '${email}'!='${None}'    Input Text Into Element    ${txt_email_signup}    ${email}    clear_text=${True}
    Run Keyword If    '${password}'!='${None}'    Input Text Into Element    ${txt_password_signup}    ${password}    clear_text=${True}
    # Run Keyword If    '${confirm_password}'!='${None}'    Input Text Into Element    ${txt_confirm_password_signup}    ${confirm_password}    clear_text=${True}
    # Run Keyword If    ${confirm_password_check}==${True}    Click Visible Element    ${chk_confirm_strong_password_signup}
    Run Keyword If    '${country}'!='${None}'    Select Country    ${country}
    Run Keyword If    '${region}'!='${None}'    Select Region    ${region}
    Run Keyword If    '${referrer_code}'!='${None}'    Input Text Into Element    ${txt_referrer_code_signup}    ${referrer_code}
    Tap Submit Sign Up Button
    
Tap Submit Sign Up Button
    Click Visible Element    ${btn_signup_signup}    swipe=DOWN

Select Country
    [Arguments]    ${country}
    Click Visible Element    ${drd_country_signup}
    Click Visible Element    ${btn_clear_search_country_signup}
    Input Text Into Element    ${txt_search_signup}    ${country}
    ${country_element}    Generate Element From Dynamic Locator    ${drd_location_by_text}    ${country}
    Click Visible Element    ${country_element}
    
Select Region
    [Arguments]    ${region}
    Click Visible Element    ${drd_region_signup}
    Click Visible Element    ${btn_clear_search_country_signup}
    Input Text Into Element    ${txt_search_signup}    ${region}
    ${region_element}    Generate Element From Dynamic Locator    ${drd_location_by_text}    ${region}
    Click Visible Element    ${region_element}

Generate Unique String
    ${unique_string}    Random Unique String By Epoch Datetime    result_format=%d%m%Y%H%M
    Set Test Variable    ${UNIQUE_STRING}    ${unique_string}

Verify Invalid Username Error Message
    [Arguments]    ${message}
    ${message_locator}    Generate Element From Dynamic Locator    ${lbl_invalid_username_signup}    ${message}
    Wait Element Is Visible    ${message_locator}
    
Verify Registration Closed Error Message
    [Arguments]    ${message}
    ${error_message_element}    Generate Element From Dynamic Locator    ${lbl_registration_closed_by_location_signup}    ${message}
    Wait Element Is Visible    ${error_message_element}