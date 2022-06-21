*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Run Keywords    Cancel All Orders
...    AND    Close Test Application

*** Test Cases ***
trading_order_form_stop_exchange_normal
    Access Trading Pair    TESTBTC:TESTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Stop
    Select Order Form Tab    Exchange
    Create Stop Order    15000    0.0025    buy    confirm=${False}
    Verify Price Warning Popup
    Create Stop Order    35000    0.0025    sell    confirm=${False}
    Verify Price Warning Popup
    Create Stop Order    35000    0.0025    buy
    Create Stop Order    20000    0.0025    sell
    
trading_order_form_stop_exchange_tif
    Create Stop Order    35000    0.0025    buy    tif=${True}
    Create Stop Order    20000    0.0025    sell    tif=${True}