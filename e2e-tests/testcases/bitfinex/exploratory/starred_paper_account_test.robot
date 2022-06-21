*** Settings ***
Resource    ../../../../mobile/resources/init.robot
Resource    ../../../../mobile/keywords/bitfinex/trading_keywords.robot
Resource    ../../../../mobile/resources/testdata/production/bitfinex_data.robot

Suite Setup    Run Keywords    Open Apps    Bitfinex
...    AND    Login And Set Up Pin    ${TEST_DATA_PAPER_TRADING_API_KEY}    ${TEST_DATA_PAPER_TRADING_API_SECRET}    Production
Suite Teardown    Close Test Application

*** Test Cases ***
trading
    Tap Starred Icon
    Verify Label Displays    TESTBTC
    Verify Label Not Display    AAA
    Tap Starred Icon
    Verify Label Displays    TESTBTC
    Verify Label Displays    AAA
    
derivatives
    Tap On Navigation Tab By Name    Derivatives
    Tap Starred Icon
    Verify Label Displays    No tickers found
    Verify Label Not Display    TESTBTCF0
    Tap Starred Icon
    Verify Label Displays    TESTBTCF0
    Verify Label Not Display    No tickers found
    
funding
    Tap On Navigation Tab By Name    Funding
    Tap Starred Icon
    Verify Label Displays    No tickers found
    Verify Label Not Display    TESTBTC
    Tap Starred Icon
    Verify Label Not Display    No tickers found
    Verify Label Displays    TESTBTC