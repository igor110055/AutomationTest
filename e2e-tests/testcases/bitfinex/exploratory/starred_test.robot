*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_pair_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_FULL_VERIFIED_API_KEY}    ${TEST_DATA_FULL_VERIFIED_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
trading
    Tap Starred Icon
    Verify Label Displays    BTC
    Verify Label Displays    DOT
    Verify Label Not Display    ETH
    Tap Starred Icon
    Verify Label Displays    ETH
    
derivatives
    Tap On Navigation Tab By Name    Derivatives
    Tap Starred Icon
    Verify Label Displays    BTC-PERP
    Verify Label Not Display    ETH-PERP
    Tap Starred Icon
    Verify Label Displays    BTC-PERP
    Verify Label Displays    ETH-PERP
    
funding
    Tap On Navigation Tab By Name    Funding
    Tap Starred Icon
    Verify Label Displays    ETH
    Verify Label Displays    BTC
    Verify Label Not Display    LUNA
    Tap Starred Icon
    Verify Label Displays    ETH
    Verify Label Displays    BTC
    Verify Label Displays    LUNA