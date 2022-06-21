*** Settings ***
Resource    ../../resources/locators/android/bitfinex/wallet_transfer_locators.robot

*** Keywords ***
Transfer Currency
    [Arguments]    ${source}    ${destination}    ${amount}=default
    ${source_element}    Generate Element From Dynamic Locator    ${rdo_source_wallet}    ${source}
    Click Visible Element    ${source_element}
    ${destination_element}    Generate Element From Dynamic Locator    ${rdo_destination_wallet}    ${destination}
    Click Visible Element    ${destination_element}
    Run Keyword If    "${amount}"!="default"    Input Text To Textbox    ${amount}
    Tap Element By Label    Transfer
    Sleep    3s