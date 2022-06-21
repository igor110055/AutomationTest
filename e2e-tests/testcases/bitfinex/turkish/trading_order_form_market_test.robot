*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    BitfinexTurkish
...    AND    Login And Set Up Pin Turkish App    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
trading_order_form_market_tabs
    [Tags]     smoke    prod_paper
    Access Trading Pair    TESTBTC:TESTUSD
    Swipe To Panel    ORDER BOOK    0.1    DOWN
    Select Order Type    Market

trading_order_form_market_exchange    
    Create Market Order    0.0025    buy
    Create Market Order    0.0025    sell