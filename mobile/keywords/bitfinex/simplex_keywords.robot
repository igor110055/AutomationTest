*** Settings ***
Resource    ../../resources/locators/android/bitfinex/simplex_locators.robot

*** Keywords ***
Verify Simplex Order Summary
    Wait Element Is Visible    ${lbl_card_details_simplex}    timeout=30s