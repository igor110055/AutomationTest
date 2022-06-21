*** Settings ***
Resource    ../../resources/locators/android/bitfinex/withdraw_locators.robot

*** Keywords ***
Tap I Button Withdraw
    Click Visible Element    ${btn_i_withdraw}

Select Cryptocurrencies Dropdown
    [Arguments]    ${currency}
    Click Visible Element    ${drd_cryptocurrencies_withdraw}    delay=1s
    ${cryptocurrency_element}    Generate Element From Dynamic Locator    ${drd_withdraw_dropdown_item_by_text}    ${currency}
    Click Visible Element    ${cryptocurrency_element}    delay=1s

Select Payment Type Dropdown
    [Arguments]    ${payment_type}
    Click Visible Element    ${drd_payment_type_withdraw}    delay=1s
    ${payment_type_element}    Generate Element From Dynamic Locator    ${drd_withdraw_dropdown_item_by_text}    ${payment_type}
    Click Visible Element    ${payment_type_element}    delay=1s

Select Choose Tether Dropdown
    [Arguments]    ${tether}
    Click Visible Element    ${drd_choose_tether}    delay=1s
    ${tether_element}    Generate Element From Dynamic Locator    ${drd_tether_dropdown_item_by_text}    ${tether}
    Click Visible Element    ${tether_element}    delay=1s

Tap Next Button On Witdraw
    Click Visible Element    ${btn_next_withdraw}    swipe=DOWN

Tap Address Book Button
    Click Visible Element    ${btn_address_book}

Tap Close Button On Choose Address
    Click Visible Element    ${btn_close_choose_address}
    
Verify Payment Type Dropdown Is Enabled
    Wait Until Element Is Enabled    ${drd_payment_type_withdraw}
    
Verify Address Book Empty Displays
    Wait Element Is Visible    ${lbl_address_book_empty}
    
Verify From Wallet Dropdown Is Disappear
    Wait Element Disappear    ${drd_from_wallet_withdraw}
    
Verify Polkadot Subscan Screen Displays
    Wait Element Is Visible    ${lbl_polkadot_subscan}