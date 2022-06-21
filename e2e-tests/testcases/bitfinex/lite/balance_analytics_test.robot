*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Test Teardown    Close Test Application
*** Test Cases ***
has_wallet_balance_analytics
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production    lite_mode=${True}
    Tap On Navigation Tab By Name    Wallets
    Tap Balances Balance Analytics Button
    Verify Balances Analytics Tab Displays
    
empty_wallet
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_VERIFIED_API_KEY}    ${TEST_DATA_BASIC_VERIFIED_API_SECRET}    Production    lite_mode=${True}
    Tap On Navigation Tab By Name    Wallets
    Tap Balances Balance Analytics Button
    Verify Balances Analytics Tab Displays    empty_wallet=${True}