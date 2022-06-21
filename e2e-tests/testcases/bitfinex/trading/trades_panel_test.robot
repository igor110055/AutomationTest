*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
report_market
    Access Trading Pair    BTCUSD
    Swipe To Panel    ORDER HISTORY    0.08    DOWN
    Tap Element By Label    FULL TRADE
    Tap Element By Label    FULL HISTORY    swipe=DOWN
    Verify Label Displays    Public Trades
    Verify Label Displays    BTC:USD
    Tap On Back Button    2
    
report_yours
    Tap Element By Label    Yours
    Tap Element By Label    FULL TRADE
    Tap Element By Label    FULL HISTORY    swipe=DOWN
    Verify Label Displays    Trades
    Verify Label Displays    BTC:USD