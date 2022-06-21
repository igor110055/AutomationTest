*** Settings ***

Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/derivatives_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application
*** Test Cases ***
limit
    Tap On Navigation Tab By Name    Derivatives
    Access Trading Pair On Derivatives    BTCF0:USTF0
    Scroll To Panel On Derivative Pair    ORDER BOOK    0.17    DOWN
    Select Order Type On Derivatives    Limit
    Input Order Price Derivatives    max_bid
    Input Order Amount Derivatives    12345678
    
market
    Select Order Type On Derivatives    Market
    Input Order Amount Derivatives    0.000001