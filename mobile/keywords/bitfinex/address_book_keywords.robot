*** Settings ***
Resource    ../../resources/locators/android/bitfinex/address_book_locators.robot

*** Keywords ***
Tap Add Address Button
    Click Visible Element    ${btn_add_address_address_book}
    
Select Cryptocurrency Dropdown Item
    [Arguments]    ${cryptocurrency}
    Click Visible Element    ${drd_select_cryptocurrency}
    Input Text To Textbox    ${cryptocurrency}
    Tap Element By Label    ${cryptocurrency}
    
Add Address To Address Book
    [Arguments]    ${cryptocurrency}    ${label}    ${address}    ${submit}=${True}    ${input_address}=INPUT
    Select Cryptocurrency Dropdown Item    ${cryptocurrency}
    Input Text Into Element    ${txt_label_address_book}    ${label}    clear_text=${True}
    Run Keyword If    "${input_address}"=="INPUT"    Input Text Into Element    ${txt_address_address_book}    ${address}    clear_text=${True}
    ...    ELSE    Click Visible Element    ${btn_paste_address_address_book}
    Run Keyword If    ${submit}==${True}    Click Visible Element    ${btn_submit_address_book}    delay=5s
    
Delete Address Book
    [Arguments]    ${address}
    ${delete_element}    Generate Element From Dynamic Locator    ${btn_delete_address_icon_by_address}    ${address}
    Click Visible Element    ${delete_element}
    Tap Element By Label    Remove
    Sleep   3s