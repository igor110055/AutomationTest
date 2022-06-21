*** Settings ***
Resource    ../../resources/locators/android/bitfinex/mercuryo_locators.robot

*** Keywords ***
Verify Mercuryo Order Summary
    Wait Element Is Visible    ${lbl_buy_crypto_mercuryo}    timeout=30s