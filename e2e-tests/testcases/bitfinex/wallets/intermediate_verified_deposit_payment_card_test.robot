*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/payment_card_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/simplex_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/mercuryo_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/ownr_wallet_keywords.robot

Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_INTERMIDIATE_API_KEY}    ${TEST_DATA_INTERMIDIATE_API_SECRET}    Staging
Suite Teardown    Close Test Application

*** Test Cases ***
deposit_payment_card_intermediate_verified_simplex
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Payment Card
    Select Payment Method On Payment Card Deposit    Simplex
    Tap Min Amount Button
    Tap TOS Agree Checkbox
    Tap Submit Button
    Tap Okay On Please Confirm Popup
    Verify Simplex Order Summary
    Tap On Back Button    2