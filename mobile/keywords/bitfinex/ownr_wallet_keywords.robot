*** Settings ***
Resource    ../../resources/locators/android/bitfinex/ownr_wallet_locators.robot

*** Keywords ***
Verify Ownr Wallet Order Summary
    Wait Element Is Visible    ${lbl_purchase_through_bitfinex_ownr_wallet}    timeout=30s