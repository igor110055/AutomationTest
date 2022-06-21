*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/common_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/calculator_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Run Keywords    Cancel All Orders Derivatives
...    AND    Close Test Application

*** Test Cases ***
derivatives_order_form_limit_order_normal
    Tap On Navigation Tab By Name    Derivatives
    Access Trading Pair On Derivatives    TESTBTCF0:TESTUSDTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Select Order Type On Derivatives    Limit
    
    Create Limit Order Derivatives    25000    0.0025    buy
    Create Limit Order Derivatives    90000    0.0025    sell

derivatives_order_form_limit_order_oco
    Create Limit Order Derivatives    25000    0.0025    buy    oco=${True}    oco_stop_price=90000
    Create Limit Order Derivatives    90000    0.0025    sell    oco=${True}    oco_stop_price=25000

derivatives_order_form_limit_order_hidden
    Create Limit Order Derivatives    25000    0.0025    buy    hidden=${True}
    Create Limit Order Derivatives    90000    0.0025    sell    hidden=${True}

derivatives_order_form_limit_order_post_only
    Create Limit Order Derivatives    25000    0.0025    buy    post_only=${True}
    Create Limit Order Derivatives    90000    0.0025    sell    post_only=${True}

derivatives_order_form_limit_order_tif
    Create Limit Order Derivatives    25000    0.0025    buy    tif=${True}
    Create Limit Order Derivatives    90000    0.0025    sell    tif=${True}

derivatives_order_form_order_types
    Select Order Type On Derivatives    Stop
    Select Order Type On Derivatives    Stop Limit
    Select Order Type On Derivatives    Trailing Stop
    Select Order Type On Derivatives    Fill or Kill
    Select Order Type On Derivatives    Immediate or Cancel
    Select Order Type On Derivatives    Limit (Order Book)
    Select Order Type On Derivatives    Scaled