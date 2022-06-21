*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/payment_card_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/mercuryo_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
mercuryo
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Payment Card
    Verify Payment Method    Bitcoin    MIN    TRY

*** Keywords ***
Verify Payment Method
    [Arguments]    ${currency}    ${amount}    ${fiat_currency}
    Select Payment Method On Payment Card Deposit    Mercuryo
    Select Deposit Currency    ${currency}
    Run Keyword If    "${amount}"=="MIN"    Tap Min Amount Button
    ...    ELSE IF    "${amount}"=="MAX"    Tap Max Amount Button
    ...    ELSE    Input Amount On Payment Card Deposit    ${amount}
    Select Deposit Currency Fiat    ${fiat_currency}
    Tap TOS Agree Checkbox
    Tap Submit Button
    Tap Okay On Please Confirm Popup
    Verify Mercuryo Order Summary
    Tap On Back Button    2