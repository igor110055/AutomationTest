*** Settings ***
Resource    ../../resources/locators/android/bitfinex/cryptocurrency_deposit_locators.robot

*** Keywords ***
Verify Cryptocurrency Deposit Screen Displays
    Wait Element Is Visible    ${lbl_to_copy_an_address_cryptocurrency_deposit}