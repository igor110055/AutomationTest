*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Run Keywords    Cancel All Orders
...    AND    Close Test Application

*** Test Cases ***
trading_order_form_trailing_stop_exchange_normal
    Access Trading Pair    TESTBTC:TESTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Trailing Stop
    Select Order Form Tab    Exchange
    Create Trailing Stop Order    90000    0.0025    buy
    Create Trailing Stop Order    50000    0.0025    sell
    
trading_order_form_trailing_stop_exchange_tif
    Create Trailing Stop Order    90000    0.0025    buy    tif=${True}
    Create Trailing Stop Order    50000    0.0025    sell    tif=${True}
    
trading_order_form_trailing_stop_margin_normal
    Select Order Form Tab    Margin
    Create Trailing Stop Order    90000    0.0025    buy
    Create Trailing Stop Order    50000    0.0025    sell
    
trading_order_form_trailing_stop_margin_tif
    Create Trailing Stop Order    90000    0.0025    buy    tif=${True}
    Create Trailing Stop Order    50000    0.0025    sell    tif=${True}