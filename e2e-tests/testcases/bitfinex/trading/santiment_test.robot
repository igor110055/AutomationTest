*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
trade_usd
    Search Ticker    TRADE
    Access Trading Pair    TRADE:USD
    Tap Doc Icon On Ticker
    Tap Element By Label    About
    Verify Label Displays    Polytrade
    
trade_usdt
    Tap On Back Button    2
    Access Trading Pair    TRADE:UST
    Tap Doc Icon On Ticker
    Tap Element By Label    About
    Verify Label Displays    Polytrade