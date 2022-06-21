*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/fast_pay_support_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
hide_small_balance_ln_btc
    Tap On Navigation Tab By Name    Wallets
    Tap Configure Balance
    Configure Small Balance Threshold    5
    Verify Label Not Display    LN-BTC
    Tap Configure Balance
    Configure Small Balance Threshold    4
    Verify Label Displays    LN-BTC
    
hide_small_balance_usd
    Tap Configure Balance
    Configure Small Balance Threshold    4700
    Verify Label Not Display    USD
    Tap Configure Balance
    Configure Small Balance Threshold    4599
    Verify Label Displays    USD