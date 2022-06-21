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
trading_order_form_scaled_exchange_normal
    Access Trading Pair    TESTBTC:TESTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Scaled
    Select Order Form Tab    Exchange
    Create Fill Or Kill Order    90000    0.0025    buy
    Create Fill Or Kill Order    35000    0.0025    sell
    
trading_order_form_scaled_margin_normal
    Select Order Form Tab    Margin
    Create Fill Or Kill Order    35000    0.0025    buy
    Verify Price Warning Popup
    Create Fill Or Kill Order    90000    0.0025    sell
    Verify Price Warning Popup
    Create Fill Or Kill Order    90000    0.0025    buy
    Create Fill Or Kill Order    35000    0.0025    sell