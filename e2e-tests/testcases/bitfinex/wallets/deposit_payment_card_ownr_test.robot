*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/payment_card_deposit_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/ownr_wallet_keywords.robot

Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
ownr_usdt_tron_min_max
    Tap On Navigation Tab By Name    Wallets
    Tap On Balances Button    Deposit
    Select Payment Type On Deposit    Payment Card
    Select Payment Method On Payment Card Deposit    Ownr Wallet
    Select Deposit Currency    USDt (Tron)
    Tap Max Amount Button
    Verify Deposit Amount Value    3999.
    Verify Fiat Amount Value    3999.
    Tap On Back Button
    
ownr
    Verify Payment Method    USDt (ETH)    MIN    RUB
    Verify Payment Method    USDt (ETH)    MAX    USD
    Verify Payment Method    Tether XAUt    MAX    GBP
    Verify Payment Method    Bitcoin    MIN    EUR
    Verify Payment Method    Ethereum    MAX    USD
    Verify Payment Method    TRON    MIN    GBP
    Verify Payment Method    Tezos    MAX    EUR
    Verify Payment Method    Litecoin    MIN    USD
    Verify Payment Method    Ethereum Classic    MAX    GBP
    Verify Payment Method    EOS    MIN    EUR
    Verify Payment Method    Zcash    MAX    USD
    Verify Payment Method    Dash    MIN    GBP
    Verify Payment Method    USDt (Tron)    MIN    EUR
    
*** Keywords ***
Verify Payment Method
    [Arguments]    ${currency}    ${amount}    ${fiat_currency}
    Select Payment Method On Payment Card Deposit    Ownr Wallet
    Select Deposit Currency    ${currency}
    Run Keyword If    "${amount}"=="MIN"    Tap Min Amount Button
    ...    ELSE    Tap Max Amount Button
    Select Deposit Currency Fiat    ${fiat_currency}
    Tap TOS Agree Checkbox
    Tap Submit Button
    Tap Okay On Please Confirm Popup
    Verify Ownr Wallet Order Summary
    Tap On Back Button    2