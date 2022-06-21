*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/wallet_keywords.robot
Resource    ../../../../mobile/resources/testdata/staging/bitfinex_data.robot

*** Test Cases ***
has_wallet_compact_view
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Staging
    Tap On Navigation Tab By Name    Wallets
    Tap Balances Compact View Button
    Verify Balances Compact View Shown    BTC    exchange
    
has_wallet_normal_view
    Tap Balances Normal View Button
    Verify Balances Normal View Shown    BTC    exchange

has_wallet_balance_analytics    
    Tap Balances Balance Analytics Button
    Verify Label Not Display    Exchange Wallet Composition
    Tap Balances Balance Analytics Button
    Verify Balances Normal View Shown    BTC    exchange
    Close Test Application
    
empty_wallet
    Open Apps    Bitfinex
    Login And Set Up Pin    ${TEST_DATA_BASIC_28FEB2022_KEY}    ${TEST_DATA_BASIC_28FEB2022_SECRET}    Staging
    Tap On Navigation Tab By Name    Wallets
    Tap Balances Balance Analytics Button
    Verify Label Displays    No Balance found
    Close Test Application